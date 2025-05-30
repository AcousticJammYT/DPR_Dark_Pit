return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 16,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 32,
  properties = {
    ["name"] = "Dark Pit - Entry"
  },
  tilesets = {
    {
      name = "pit_area_1",
      firstgid = 1,
      filename = "../../tilesets/pit_area_1.tsx",
      exportfilename = "../../tilesets/pit_area_1.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 16,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 79, 80, 80, 80, 30, 80, 80, 80, 80, 80, 80, 80, 30, 81, 0,
        0, 79, 30, 80, 80, 80, 80, 80, 80, 80, 30, 80, 80, 80, 81, 0,
        0, 92, 93, 93, 93, 93, 93, 80, 80, 93, 93, 93, 93, 93, 94, 0,
        0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 0,
        0, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 0,
        0, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 0,
        0, 27, 28, 28, 28, 28, 28, 15, 15, 28, 28, 28, 28, 28, 29, 0,
        0, 0, 0, 0, 0, 0, 0, 43, 45, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 43, 45, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 2, 2, 15, 15, 2, 2, 3, 0, 0, 0, 0,
        0, 0, 0, 0, 14, 15, 15, 15, 15, 15, 15, 16, 0, 0, 0, 0,
        0, 0, 0, 0, 59, 60, 60, 60, 60, 60, 60, 61, 0, 0, 0, 0,
        0, 0, 0, 0, 72, 73, 73, 73, 73, 73, 73, 74, 0, 0, 0, 0,
        0, 0, 0, 0, 72, 73, 73, 73, 73, 73, 73, 74, 0, 0, 0, 0,
        0, 0, 0, 0, 72, 73, 73, 73, 73, 73, 73, 74, 0, 0, 0, 0,
        0, 0, 0, 0, 72, 73, 73, 73, 73, 73, 73, 74, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 16,
      id = 5,
      name = "LockedPit",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 31, 32, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 15, 15, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 16,
          name = "pit_lock",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 280,
          width = 80,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 80,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 80,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 80,
          width = 40,
          height = 560,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 80,
          width = 40,
          height = 560,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 280,
          width = 120,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 280,
          width = 120,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 458,
          width = 320,
          height = 182,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 280,
          width = 120,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 280,
          width = 120,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "warpspawn",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 120,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["skin"] = "cyber_city"
          }
        },
        {
          id = 4,
          name = "savepoint",
          type = "",
          shape = "point",
          x = 180,
          y = 140,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["override_power"] = true,
            ["text1"] = "* Looking down into the pit, you feel uncertainty...",
            ["text2"] = "* But also power.",
            ["text3"] = "* (Savepoints in this DLC will not heal you.)"
          }
        },
        {
          id = 17,
          name = "elevatordoor",
          type = "",
          shape = "rectangle",
          x = 260,
          y = 80,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 280,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "pre_pit.lock"
          }
        },
        {
          id = 28,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 60,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "pre_pit.elevator",
            ["once"] = false
          }
        },
        {
          id = 29,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 418,
          width = 320,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "pre_pit.entry",
            ["once"] = false
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 2,
          name = "spawn",
          type = "",
          shape = "point",
          x = 320,
          y = 200,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "point",
          x = 320,
          y = 720,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "spawnpoint",
          type = "",
          shape = "point",
          x = 500,
          y = 200,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
