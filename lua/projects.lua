local M = {}

local root_markers = {
  '.git',
  'Makefile',
  'justfile',
  'package.json',
  'pyproject.toml',
  'Cargo.toml',
  'go.mod',
  'settings.gradle',
  'settings.gradle.kts',
  'pom.xml',
  'CMakeLists.txt',
  'compile_commands.json',
  'ols.json',
}

local config = {
  roots = { '~/projects' },
}

local ignored_directories = {
  ['.git'] = true,
  ['.hg'] = true,
  ['.svn'] = true,
  ['node_modules'] = true,
  ['target'] = true,
  ['build'] = true,
  ['dist'] = true,
  ['vendor'] = true,
}

local function scan_directory(directory, markers, projects, errors)
  local handle, error_message = vim.uv.fs_scandir(directory)
  if not handle then
    table.insert(errors, string.format('%s: %s', directory, error_message))
    return
  end

  local child_directories = {}
  local is_project = false

  while true do
    local name, entry_type = vim.uv.fs_scandir_next(handle)
    if not name then
      break
    end

    if markers[name] then
      is_project = true
    elseif entry_type == 'directory' and not ignored_directories[name] then
      table.insert(child_directories, vim.fs.joinpath(directory, name))
    end
  end

  if is_project then
    projects[directory] = true
    return
  end

  for _, child in ipairs(child_directories) do
    scan_directory(child, markers, projects, errors)
  end
end

local function find_projects(roots)
  local markers = {}
  for _, marker in ipairs(root_markers) do
    markers[marker] = true
  end

  local projects = {}
  local errors = {}
  for _, root in ipairs(roots) do
    local directory = vim.fs.normalize(vim.fn.expand(root))
    if vim.fn.isdirectory(directory) == 1 then
      scan_directory(directory, markers, projects, errors)
    else
      table.insert(errors, string.format('%s: directory does not exist', directory))
    end
  end

  local result = vim.tbl_keys(projects)
  table.sort(result)
  return result, errors
end

local function select_project(roots)
  local projects, errors = find_projects(roots)
  if #projects == 0 then
    local details = #errors > 0 and ('\n' .. table.concat(errors, '\n')) or ''
    vim.notify('No projects found.' .. details, vim.log.levels.WARN)
    return
  end

  local target_window = vim.api.nvim_get_current_win()
  MiniPick.start({
    source = {
      name = 'Projects',
      items = projects,
      choose = function(project)
        vim.api.nvim_set_current_win(target_window)
        vim.cmd({ cmd = 'cd', args = { project } })
        vim.notify('Project: ' .. vim.fn.fnamemodify(project, ':~'))
      end,
    },
  })
end

function M.select()
  select_project(config.roots)
end

function M.select_from_directory()
  vim.ui.input({
    prompt = 'Project search directory: ',
    default = config.roots[1],
    completion = 'dir',
  }, function(directory)
    if not directory or directory == '' then
      return
    end

    select_project({ directory })
  end)
end

function M.setup(opts)
  config = vim.tbl_deep_extend('force', config, opts or {})
end

return M
