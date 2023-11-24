-- Detecting Front Block -- 
function detectF()
  checkFuel()
  while turtle.detect() do
    turtle.dig()
  end
  turtle.forward()
end

-- Detecting Top Block -- 
function detectT()
  checkFuel()
  while turtle.detectUp() do
    turtle.digUp()
  end
end

-- Detecting Bottom Block --
function detectB()
  checkFuel()
  while turtle.detectDown() do
    turtle.digDown()
  end
end

-- Place Bridge -- 
function placeB()
  checkFuel()
  i = 1
    while i <= 16
    do
        turtle.select(i)
        if (turtle.getItemDetail(i).name ~= "minecraft:cobbled_deepslate" and i < 16) then
            i = i + 1
        elseif turtle.getItemDetail(i).name == "minecraft:cobbled_deepslate" and turtle.getItemCount(i) > 1 then
            turtle.place()
            break
        else
            print("No more stairs! :(")
            while 1 do 
        end
    end
end

-- Checking Fuel -- 
function checkFuel() 
  if turtle.getFuelLevel() < 100 then
        i = 1
        while i <= 16
        do
            turtle.select(i)        
            if turtle.getItemDetail(i) == nil and i < 16 then
                i = i + 1
            elseif (turtle.getItemDetail(i).name == "minecraft:coal" or turtle.getItemDetail(i).name == "minecraft:charcoal") and turtle.getItemCount(i) > 1 then
                turtle.refuel()
                break
            elseif i == 16 then 
                print("No more fuel! :(")
                while 1 do end
            elseif turtle.getItemDetail(i) ~= nil and i < 16 then
                i = i + 1
            end
        end
    end
end

-- Main -- 
while 1 do
  detectF()
  detectT()
  detectB()
  placeB()
end
