return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = '*',
    opts = {
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-e: Hide menu
      -- C-k: Toggle signature help
      --
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = { preset = 'default' },

      appearance = {
	use_nvim_cmp_as_default = true,
	nerd_font_variant = 'mono'
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },
      completion = {
	menu = { auto_show = false }
      }
    },
    opts_extend = { "sources.default" }
  }
}
