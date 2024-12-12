return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 5,
  nextobjectid = 8,
  properties = {
    ["name"] = "Dark Pit - Floor 10"
  },
  tilesets = {
    {
      name = "pit_area_1",
      firstgid = 1,
      filename = "../tilesets/pit_area_1.tsx",
      exportfilename = "../tilesets/pit_area_1.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
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
        0, 79, 80, 30, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 81, 0,
        0, 79, 80, 80, 80, 80, 30, 80, 80, 80, 80, 80, 30, 80, 81, 0,
        0, 92, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 94, 0,
        0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 0,
        0, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 0,
        0, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 0,
        0, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 0,
        0, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 0,
        0, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 0,
        0, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 0,
        0, 27, 28, 28, 28, 28, 28, 15, 15, 28, 28, 28, 28, 28, 29, 0,
        0, 0, 0, 0, 0, 0, 0, 14, 16, 0, 0, 0, 0, 0, 0, 0
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
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 640,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 120,
          width = 40,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 440,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 440,
          width = 280,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 120,
          width = 40,
          height = 320,
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
          id = 6,
          name = "savepoint",
          type = "",
          shape = "point",
          x = 320,
          y = 160,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
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
          id = 7,
          name = "spawn",
          type = "",
          shape = "point",
          x = 320,
          y = 400,
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
