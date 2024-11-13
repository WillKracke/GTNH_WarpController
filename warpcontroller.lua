local TRANSPOSER_ID = "xxxx";
local TRANSPOSER = component.get(TRANSPOSER_ID);

while true do
    print(TRANSPOSER.getStackInSlot(1, 1));
    print("Current Dest: ");
    
    print("Available Destinations: ");

    print("Input Target");
    local input = io.read();

end