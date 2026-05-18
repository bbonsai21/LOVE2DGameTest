---@diagnostic disable: lowercase-global

--!MODULES--
_G.love = require("love");
local Data = require("Data");
local UI = require("UI");
local Mouse = require("Mouse");
local World = require("World");
local Math = require("Math");

--!ENVIROMENT VARIABLES--
_G.DEBUGGING = true;

--!MAIN--
function love.load()
    love.graphics.setBackgroundColor(0,0,0);
    World.new();
end

function love.update(dt)
    if DEBUGGING then
        love.window.setTitle("FPS: \n" .. love.timer.getFPS() .. " | V-sync: ".. love.window.getVSync());
    end

    Mouse.update();
    World.update();
    UI.update();
end

function love.draw()
    if not love.window.hasFocus() or not love.window.isVisible() then -- saving resources only on rendering, but keeping the update loop live
        return;
    end

    World.render();
    UI.render();
end