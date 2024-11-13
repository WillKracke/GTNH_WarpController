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

    local emptyslot = nil;

    print("Available Destinations: ");
    if tspr.getInventorySize(sides.front) == nil then
        print("ERROR: No Inventory Attached to Front!");
    else
        for i = 1, tspr.getInventorySize(sides.front) do
            local item = tspr.getStackInSlot(sides.front, i);
            if item ~= nil then
                print(item.label);
            else
                if emptyslot == nil then
                    emptyslot = i;
                end
            end
        end

        print("=====");
        print("Input Target");
        local input = io.read();
        if input == "exit" then
            loop = false;
        else
            tspr.transferItem(sides.up, sides.front, 1, 1, emptyslot);
            for i = 1, tspr.getInventorySize(sides.front) do
                local item = tspr.getStackInSlot(sides.front, i);
                if item ~= nil and item.label == input then
                    tspr.transferItem(sides.front, sides.up, 1, i, 1)
                end
            end
        end
    end
end
