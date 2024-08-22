util.require_natives(1660775568)

-- Script creado por snoopyloopy


local response = false
local localVer = 8.5
util.toast("Versión: " .. localVer)

async_http.init("raw.githubusercontent.com", "/j-11-t/RandomColors-SL/main/ColorsVersion.lua", function(output)
    currentVer = tonumber(output)
    response = true

    if localVer ~= currentVer then
        util.toast("[.0random1] Hay una actualización disponible, reinicia para actualizarlo.")
        
        menu.action(menu.my_root(), "Actualizar Lua", {}, "", function()
            async_http.init('raw.githubusercontent.com','/j-11-t/RandomColors-SL/main/.0random1.lua', function(a)
                if not a or a == "" then
                    util.toast("Hubo un fallo al descargar el script. Por favor, actualiza manualmente desde GitHub.")
                    return
                end
                
                -- Guardar el script descargado en el archivo
                local filePath = filesystem.scripts_dir() .. SCRIPT_RELPATH
                local f = io.open(filePath, "wb")
                if f then
                    f:write(a)
                    f:close()
                    util.toast("Script actualizado correctamente. Reiniciando el script...")
                    util.restart_script()
                else
                    util.toast("Error al guardar el script. Por favor, actualiza manualmente.")
                end
            end)
            async_http.dispatch()
        end)
    else
        util.toast("Tu script ya está actualizado.")
    end
end, function() 
    response = true 
end)






--[[
    async_http.init("raw.githubusercontent.com", "/j-11-t/RandomColors-SL/main/KillSwitch.lua", function(output)
    currentKs = tostring(output)
    response = true
    if currentKs == "true" then
        util.toast("[.0random1] El KillSwitch esta activo, cerrando script...")
        util.yield(2000)
        util.stop_script()
    else 
        util.yield(5)
    end
end, function() response = true end)
]]
async_http.dispatch()

repeat 
    util.yield()
until response

--[[ 
    Adding In a Future Update
    resources_dir = filesystem.resources_dir() .. '.0random1/'
]]





function generateRandomColors()
    local primaryColor = {
        math.random(0, 255),
        math.random(0, 255),
        math.random(0, 255)
    }
    local secondaryColor = {
        math.random(0, 255),
        math.random(0, 255),
        math.random(0, 255)
    }
    local pearlescentColor = math.random(0, 159)
    
    return primaryColor, secondaryColor, pearlescentColor
end



-- 𝑭𝒖𝒏𝒄𝒕𝒊𝒐𝒏 𝒕𝒐 𝒓𝒂𝒏𝒅𝒐𝒎𝒍𝒚 𝒔𝒆𝒍𝒆𝒄𝒕 𝒄𝒐𝒍𝒐𝒓𝒔.
function setRandomColors()
    -- Select a random color for each of the three colors.
    local primaryColor, secondaryColor, pearlescentColor = generateRandomColors()
  
    -- Update the vehicle's colors with the randomly selected colors.
    VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(entities.get_user_vehicle_as_handle(), primaryColor[1], primaryColor[2], primaryColor[3])
    VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(entities.get_user_vehicle_as_handle(), secondaryColor[1], secondaryColor[2], secondaryColor[3])
    VEHICLE.SET_VEHICLE_EXTRA_COLOURS(entities.get_user_vehicle_as_handle(), pearlescentColor)
end

-- Create the "random colors" submenu in the "Vehicle Appearance"
local Randomcolors = menu.list(menu.my_root(), "Random Colors / Upgrade", {}, "Remember to save the vehicle before closing the script. (Secondary color becomes primary upon entering the workshop).")
--local Randomcolors = menu.list(menu.my_root(), "Random Colors / Upgrade", {}, "New functions added by: SnoopyLoopy#0011 (08.01.2023) Remember to save the vehicle before closing the script.")

--Add the "Set Random Colors" option to the "random colors" submenu.
menu.action(Randomcolors, "Set random colors", {}, "Set random primary, secondary, and pearlescent colors (Secondary color becomes primary upon entering the workshop)", setRandomColors)


-- 𝙊𝙥𝙩𝙞𝙤𝙣𝙨 𝙛𝙤𝙧 𝙍𝙖𝙣𝙙𝙤𝙢 𝙥𝙧𝙞𝙢𝙖𝙧𝙮 𝙘𝙤𝙡𝙤𝙧, 𝙨𝙚𝙘𝙚𝙤𝙣𝙙𝙖𝙧𝙮 𝙖𝙣𝙙 𝙥𝙚𝙖𝙧𝙡𝙚𝙨𝙘𝙚𝙣𝙩.

-- Ｒａｎｄｏｍ ｐｒｉｍａｒｙ ｃｏｌｏｒ.

-- Add the "Random primary color" option to the "random colors" submenu.
menu.action(Randomcolors, "Random primary color", {}, "Set random primary color", function()
    -- Select a random color for the primary color.
    local primaryColor, secondaryColor, pearlescentColor = generateRandomColors()
    -- Update the vehicle primary color with the randomly selected color.
    VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(entities.get_user_vehicle_as_handle(), primaryColor[1], primaryColor[2], primaryColor[3])

end)

-- Ｒａｎｄｏｍ ｓｅｃｏｎｄａｒｙ ｃｏｌｏｒ．

-- Add the "Random secondary color" option to the "random colors" submenu.
menu.action(Randomcolors, "Random secondary color", {}, "Set random secondary color (Secondary color becomes primary upon entering the workshop)", function()
    -- Select a random color for the secondary color.
    local primaryColor, secondaryColor, pearlescentColor = generateRandomColors()
    -- Update the vehicle secondary color with the randomly selected color.
    VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(entities.get_user_vehicle_as_handle(), secondaryColor[1], secondaryColor[2], secondaryColor[3])
end)

-- Ｒａｎｄｏｍ ｐｅａｒｌｅｓｃｅｎｔ

-- Add the "Random pearlescent" option to the "random colors" submenu.
menu.action(Randomcolors, "Random pearlescent", {}, "Set random pearlescent color", function()
    -- Select a random color for the pearlescent.
    local primaryColor, secondaryColor, pearlescentColor = generateRandomColors()
    -- Update the vehicle pearlescent with the randomly selected color.
    VEHICLE.SET_VEHICLE_EXTRA_COLOURS(entities.get_user_vehicle_as_handle(), pearlescentColor)
end)


-- Random primary and pearlescent
menu.action(Randomcolors, "Random primary color and pearlescent", {}, "Set random primary and pearlescent color", function()
    -- Select a random color for the pearlescent.
    local primaryColor, secondaryColor, pearlescentColor = generateRandomColors()
    -- Update the vehicle pearlescent with the randomly selected color.
    VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(entities.get_user_vehicle_as_handle(), primaryColor[1], primaryColor[2], primaryColor[3])
    VEHICLE.SET_VEHICLE_EXTRA_COLOURS(entities.get_user_vehicle_as_handle(), pearlescentColor)
end)

--Shortcut Performance Upgrade
menu.action(Randomcolors, "Performance upgrade", {}, "This is a shortcut to Vehicle Performance Upgrade menu of Stand. (Recommended after using 'Random Upgrade' to apply performance improvements.)", function(on)
    menu.trigger_commands("performance")
end)

--Shortcut Random Upgrade
menu.action(Randomcolors, "Random upgrade", {}, "This is a shortcut to Vehicle Random Upgrade menu of Stand.", function(on)
    menu.trigger_commands("randomtune")
end)




-------------------------------------------------------------------------------------------------------------------------------------------------------------------










--                       ╭╮╱╱╱╱╱╱╭━━━╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭╮
--                       ┃┃╱╱╱╱╱╱┃╭━╮┃╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱┃┃
--                       ┃╰━┳╮╱╭╮┃╰━━┳━╮╭━━┳━━┳━━┳╮╱╭┫┃╱╱╭━━┳━━┳━━┳╮╱╭╮
--                       ┃╭╮┃┃╱┃┃╰━━╮┃╭╮┫╭╮┃╭╮┃╭╮┃┃╱┃┃┃╱╭┫╭╮┃╭╮┃╭╮┃┃╱┃┃
--                       ┃╰╯┃╰━╯┃┃╰━╯┃┃┃┃╰╯┃╰╯┃╰╯┃╰━╯┃╰━╯┃╰╯┃╰╯┃╰╯┃╰━╯┃
--                       ╰━━┻━╮╭╯╰━━━┻╯╰┻━━┻━━┫╭━┻━╮╭┻━━━┻━━┻━━┫╭━┻━╮╭╯
--                       ╱╱╱╭━╯┃╱╱╱╱╱╱╱╱╱╱╱╱╱╱┃┃╱╭━╯┃╱╱╱╱╱╱╱╱╱╱┃┃╱╭━╯┃
--                       ╱╱╱╰━━╯╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰╯╱╰━━╯╱╱╱╱╱╱╱╱╱╱╰╯╱╰━━╯