local component = require("component");
local sides = require("sides");

local tspr = component.transposer;

local loop = true;

while loop do
    print("-----");
    local current = tspr.getStackInSlot(sides.up, 1);
    if current == nil then
        print("No Current Destination")
    else
        print("Current Destination: " .. current.label);
    end
    print("-----");
    print("Available Destinations: ");
    print("debug slot" .. tspr.getInventorySize(sides.front));
    if tspr.getInventorySize(sides.front) == nil then
        print("ERROR: No Inventory Attached to Front!");
    else
        for i = 1, tspr.getInventorySize(sides.front) do
            local item = tspr.getStackInSlot(sides.front, i);
            print(item);
            if not item == nil then
                print(item.label);
            end
        end
    end

    print("=====");
    print("Input Target");
    local input = io.read();
    if input == "exit" then
        loop = false;
    end
end