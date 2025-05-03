local M = {
  "seblj/roslyn.nvim",
}

-- NOTE: virtual text only gets rendered when after editing and saving the buffer (might be more events but idk)
M.config = function()
  require("roslyn").setup({
    config = {
      settings = {
        ["csharp|inlay_hints"] = {
          csharp_enable_inlay_hints_for_implicit_object_creation = true,
          csharp_enable_inlay_hints_for_implicit_variable_types = true,
          csharp_enable_inlay_hints_for_lambda_parameter_types = true,
          csharp_enable_inlay_hints_for_types = true,
          dotnet_enable_inlay_hints_for_indexer_parameters = true,
          dotnet_enable_inlay_hints_for_literal_parameters = true,
          dotnet_enable_inlay_hints_for_object_creation_parameters = true,
          dotnet_enable_inlay_hints_for_other_parameters = true,
          dotnet_enable_inlay_hints_for_parameters = true,
          dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
        },
      },
    },

    -- NOTE: Set `filewatching` to false if you experience performance problems.
    -- Defaults to true, since turning it off is a hack.
    -- If you notice that the server is _super_ slow, it is probably because of file watching
    -- I noticed that neovim became super unresponsive on some large codebases, and that was because
    -- it schedules the file watching on the event loop.
    -- This issue went away by disabling that capability. However, roslyn will fallback to its own
    -- file watching, which can make the server super slow to initialize.
    -- Setting this option to false will indicate to the server that neovim will do the file watching.
    -- However, in `hacks.lua` I will also just don't start off any watchers, which seems to make the server
    -- a lot faster to initialize.
    filewatching = true,
  })
end

return M
