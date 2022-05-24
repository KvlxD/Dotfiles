local awful = require('awful')
local gears = require('gears')
local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

-- Rules
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      keys = client_keys,
      buttons = client_buttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_offscreen,
      floating = false,
      maximized = false,
      above = false,
      below = false,
      ontop = false,
      sticky = false,
      maximized_horizontal = false,
      maximized_vertical = false
    }
  },
  {
    rule_any = {
        name = {
            "Plank"
        }
    },
    properties = {
        ontop = true,
        callback = function(c) awful.placement.under_mouse(c) end,
        floating = true
    }
  },
  -- {
  --   rule_any = {
  --       name = {
  --           "Plank"
  --       }
  --   },
  --   properties = {
  --       ontop = true
  --   }
  -- },

  {
    rule_any = {
      class = {
        "Raven Reader"
      }
    },
    except_any = {
      role = {"GtkFileChooserDialog"},
      instance = {"Toolkit"},
      type = {"dialog"}
    },
    properties = {screen = 1, tag = "9" }
  },
  {
    rule_any = {
      class = {
        "Vieb"
      }
    },
    except_any = {
      role = {"GtkFileChooserDialog"},
      instance = {"Toolkit"},
      type = {"dialog"}
    },
    properties = {screen = 1, tag = "8" }
  },
  {
    rule_any = {
      class = {
        "DesktopEditors"
      }
    },
    except_any = {
      role = {"GtkFileChooserDialog"},
      instance = {"Toolkit"},
      type = {"dialog"}
    },
    properties = {screen = 1, tag = "6" }
  },
  {
    rule_any = {
      class = {
        "Zathura"
      }
    },
    except_any = {
      role = {"GtkFileChooserDialog"},
      instance = {"Toolkit"},
      type = {"dialog"}
    },
    properties = {screen = 1, tag = "5" }
  },
  {
    rule_any = {
      class = {
        "Emacs"
      }
    },
    except_any = {
      role = {"GtkFileChooserDialog"},
      instance = {"Toolkit"},
      type = {"dialog"}
    },
    properties = {screen = 1, tag = "2" }
  },
  {
    rule_any = {
      class = {
        "Org.gnome.Nautilus"
      }
    },
    except_any = {
      role = {"GtkFileChooserDialog"},
      instance = {"Toolkit"},
      type = {"dialog"}
    },
    properties = {screen = 1, tag = "3" }
  },
  {
    rule_any = {
      class = {
        "Spotify"
      }
    },
    except_any = {
      role = {"GtkFileChooserDialog"},
      instance = {"Toolkit"},
      type = {"dialog"}
    },
    properties = {screen = 1, tag = "7" }
  },
  {
    rule_any = {
      class = {
        "firefox"
      }
    },
    except_any = {
      role = {"GtkFileChooserDialog"},
      instance = {"Toolkit"},
      type = {"dialog"}
    },
    properties = {screen = 1, tag = "4" }
  },
  {
    rule_any = {
      class = {
        "kitty"
      }
    },
    except_any = {
      role = {"GtkFileChooserDialog"},
      instance = {"Toolkit"},
      type = {"dialog"}
    },
    properties = {screen = 1, tag = "1" }
  },
  {
    rule_any = {name = {'QuakeTerminal'}},
    properties = {skip_decoration = true}
  },
  -- Titlebars
  {
    rule_any = {type = {'dialog'}, class = {'Wicd-client.py', 'calendar.google.com'}},
    properties = {
      placement = awful.placement.centered,
      ontop = true,
      floating = true,
      drawBackdrop = true,
      shape = function()
        return function(cr, w, h)
          gears.shape.rounded_rect(cr, w, h, 8)
        end
      end,
      skip_decoration = true
    }
  }
}
