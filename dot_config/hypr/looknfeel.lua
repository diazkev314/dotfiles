-- ▗▖    ▗▄▖  ▗▄▖ ▗▖ ▗▖    ▗▖  ▗▖    ▗▄▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖
-- ▐▌   ▐▌ ▐▌▐▌ ▐▌▐▌▗▞▘    ▐▛▚▖▐▌    ▐▌   ▐▌   ▐▌   ▐▌
-- ▐▌   ▐▌ ▐▌▐▌ ▐▌▐▛▚▖     ▐▌ ▝▜▌    ▐▛▀▀▘▐▛▀▀▘▐▛▀▀▘▐▌
-- ▐▙▄▄▖▝▚▄▞▘▝▚▄▞▘▐▌ ▐▌    ▐▌  ▐▌    ▐▌   ▐▙▄▄▖▐▙▄▄▖▐▙▄▄▖

-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
  general = {
    -- Tight gaps between windows and screen edges.
    gaps_in = 3,
    gaps_out = 5,
    border_size = 3,

    -- Tokyo Night gradient: Teal to Green.
    col = {
      active_border = { colors = { "rgba(73dacaee)", "rgba(9ece6aee)" }, angle = 45 },
      inactive_border = "rgba(414868aa)",
    },

    -- Change to niri-like side-scrolling layout.
    layout = "scrolling",
  },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
  decoration = {
    -- Use round window corners.
    rounding = 10,
  },
})

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
hl.config({
  scrolling = {
    -- Half width, so two columns fill the screen exactly.
    column_width = 0.5,
  },
})
