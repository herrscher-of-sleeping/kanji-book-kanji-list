#!/usr/bin/env lua

local args = { ... }

local start = tonumber(args[1])
local stop = tonumber(args[2])

local function print_chapter(i)
  local fd = io.open("chapters/" .. i, "r")
  if not fd then
    print("Couldn't open chapter " .. i)
    os.exit(1)
  end
  io.write(fd:read("*a"))
  fd:close()
end

if start and stop then
  for i = start, stop do
    print_chapter(i)
  end
elseif start then
  print_chapter(start)
else
  print("Usage: ./select-kanji.lua start_chapter [stop_chapter]")
end
