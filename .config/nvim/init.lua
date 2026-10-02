-- ============================================================================
-- INIT.LUA - Master Entry Point
-- ============================================================================

-- Load core settings and options
require("config.options")

-- Load custom keymaps and leader key definitions
require("config.keymaps")

-- Load plugin manager
require("config.lazy")
