local fdsdev = nil
local aspetta = 5000
local creato = false
local comandomodifica = false
local prezzofinale = 0
local lastJob
local myCar = {}



--thread modifica
lsMenuIsShowed = false
RegisterNetEvent("fdsdev_mechanicmenu:open", function()
	if not IsPedInAnyVehicle(PlayerPedId()) then return end
	lsMenuIsShowed = true
	comandomodifica = true
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	FreezeEntityPosition(vehicle, true)

	myCar = GetVehicleProperties(vehicle)

	GetAction({value = 'main'})
end)


function ApriMenuMeccanico()
	veicool = GetVehiclePedIsIn(PlayerPedId(), false)
	lsMenuIsShowed = true 
	-- ShowText3DPrice()
	FreezeEntityPosition(veicool, true)
	myCar = GetVehicleProperties(veicool)
	GetAction({value = 'main'})
end

exports("ApriMenuMeccanico", ApriMenuMeccanico)

function ShowText3DPrice()
	Citizen.CreateThread(function()
		while lsMenuIsShowed do
			miid(0.95, 1.435, 1.0,1.0,0.50, "~w~Spese officina:~g~  $".. prezzofinale .. '', 255, 255, 255, 255)
			Citizen.Wait(1)
		end
	end)
end

function miid(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
	SetTextColour( 0,0,0, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

--incolla

GetLocale = function(str, a)
	if a ~= nil then
    	return Localessi[str]:format(a)
	else
		return Localessi[str]
	end
end

Localessi = {
	['by_default'] = 'Default',
  ['installed'] = 'installed',
  ['already_own'] = 'you already own: %s',
  ['not_enough_money'] = 'you cannot afford this mod!',
  ['purchased'] = 'you have purchased the mod!',
  ['press_custom'] = 'press ~b~[E]~s~ to Personalise Your Vehicle',
  ['level'] = 'level %s',
  ['neon'] = 'neon',
  ['blip_name'] = 'los Santos Customs',
-- Paint Colors
  -- Black
  ['black'] = 'black',
  ['graphite'] = 'graphite',
  ['black_metallic'] = 'black Metallic',
  ['caststeel'] = 'cast Steel',
  ['black_anth'] = 'black Anthracite',
  ['matteblack'] = 'matte Black',
  ['darknight'] = 'dark Night',
  ['deepblack'] = 'deep Black',
  ['oil'] = 'oil',
  ['carbon'] = 'carbon',
  -- White
  ['white'] = 'white',
  ['vanilla'] = 'vanilla',
  ['creme'] = 'creme',
  ['polarwhite'] = 'polar White',
  ['beige'] = 'beige',
  ['mattewhite'] = 'matte White',
  ['snow'] = 'snow',
  ['cotton'] = 'cotton',
  ['alabaster'] = 'alabaster',
  ['purewhite'] = 'pure White',
  -- Grey
  ['grey'] = 'grey',
  ['silver'] = 'silver',
  ['metallicgrey'] = 'metallic Grey',
  ['laminatedsteel'] = 'laminated Steel',
  ['darkgray'] = 'dark Grey',
  ['rockygray'] = 'rocky Grey',
  ['graynight'] = 'gray Night',
  ['aluminum'] = 'aluminum',
  ['graymat'] = 'matte Grey',
  ['lightgrey'] = 'light Grey',
  ['asphaltgray'] = 'asphalt Grey',
  ['grayconcrete'] = 'concrete Grey',
  ['darksilver'] = 'dark Silver',
  ['magnesite'] = 'magnesite',
  ['nickel'] = 'nickel',
  ['zinc'] = 'zinc',
  ['dolomite'] = 'dolomite',
  ['bluesilver'] = 'blue Silver',
  ['titanium'] = 'titanium',
  ['steelblue'] = 'steel Blue',
  ['champagne'] = 'champagne',
  ['grayhunter'] = 'grey Hunter',
  -- Red
  ['red'] = 'red',
  ['torino_red'] = 'torino Red',
  ['poppy'] = 'poppy',
  ['copper_red'] = 'copper Red',
  ['cardinal'] = 'cardinal Red',
  ['brick'] = 'brick Red',
  ['garnet'] = 'Garnet',
  ['cabernet'] = 'cabernet Red',
  ['candy'] = 'candy Red',
  ['matte_red'] = 'matte Red',
  ['dark_red'] = 'dark Red',
  ['red_pulp'] = 'red Pulp',
  ['bril_red'] = 'brilliant Red',
  ['pale_red'] = 'pale Red',
  ['wine_red'] = 'wine Red',
  ['volcano'] = 'Volcano',
  -- Pink
  ['pink'] = 'pink',
  ['electricpink'] = 'electric Pink',
  ['brightpink'] = 'bright Pink',
  ['salmon'] = 'salmon',
  ['sugarplum'] = 'sugar Plum',
  -- Blue
  ['blue'] = 'blue',
  ['topaz'] = 'topaz',
  ['light_blue'] = 'light Blue',
  ['galaxy_blue'] = 'galaxy Blue',
  ['dark_blue'] = 'dark Blue',
  ['azure'] = 'azure',
  ['navy_blue'] = 'navy Blue',
  ['lapis'] = 'lapis Lazuli',
  ['blue_diamond'] = 'blue Diamond',
  ['surfer'] = 'surfer',
  ['pastel_blue'] = 'pastel Blue',
  ['celeste_blue'] = 'celeste Blue',
  ['rally_blue'] = 'rally Blue',
  ['blue_paradise'] = 'blue Paradise',
  ['blue_night'] = 'blue Night',
  ['cyan_blue'] = 'cyan Blue',
  ['cobalt'] = 'cobalt',
  ['electric_blue'] = 'electric Blue',
  ['horizon_blue'] = 'horizon Blue',
  ['metallic_blue'] = 'metallic Blue',
  ['aquamarine'] = 'aquamarine',
  ['blue_agathe'] = 'blue Agathe',
  ['zirconium'] = 'zirconium',
  ['spinel'] = 'spinel',
  ['tourmaline'] = 'tourmaline',
  ['paradise'] = 'paradise',
  ['bubble_gum'] = 'bubble Gum',
  ['midnight_blue'] = 'midnight Blue',
  ['forbidden_blue'] = 'forbidden Blue',
  ['glacier_blue'] = 'glacier Blue',
  -- Yellow
  ['yellow'] = 'yellow',
  ['wheat'] = 'wheat',
  ['raceyellow'] = 'race Yellow',
  ['paleyellow'] = 'pale Yellow',
  ['lightyellow'] = 'light Yellow',
  -- Green
  ['green'] = 'green',
  ['met_dark_green'] = 'metallic Dark Green',
  ['rally_green'] = 'Rally Green',
  ['pine_green'] = 'pine Green',
  ['olive_green'] = 'olive Green',
  ['light_green'] = 'Light Green',
  ['lime_green'] = 'lime green',
  ['forest_green'] = 'forest Green',
  ['lawn_green'] = 'lawn Green',
  ['imperial_green'] = 'imperial Green',
  ['green_bottle'] = 'breen Bottle',
  ['citrus_green'] = 'citrus Green',
  ['green_anis'] = 'green Anis',
  ['khaki'] = 'Khaki',
  ['army_green'] = 'army Green',
  ['dark_green'] = 'dark Green',
  ['hunter_green'] = 'hunter Green',
  ['matte_foilage_green'] = 'matte Foilage Green',
  -- Orange
  ['orange'] = 'orange',
  ['tangerine'] = 'Tangerine',
  ['matteorange'] = 'Matte Orange',
  ['lightorange'] = 'Light Orange',
  ['peach'] = 'Peach',
  ['pumpkin'] = 'Pumpkin',
  ['orangelambo'] = 'Orange Lambo',
  -- Brown
  ['brown'] = 'brown',
  ['copper'] = 'Copper',
  ['lightbrown'] = 'Light Brown',
  ['darkbrown'] = 'Dark Brown',
  ['bronze'] = 'Bronze',
  ['brownmetallic'] = 'Brown Metallic',
  ['expresso'] = 'Expresso',
  ['chocolate'] = 'Chocolate',
  ['terracotta'] = 'Terracotta',
  ['marble'] = 'Marble',
  ['sand'] = 'Sand',
  ['sepia'] = 'Sepia',
  ['bison'] = 'Bison',
  ['palm'] = 'Palm',
  ['caramel'] = 'Caramel',
  ['rust'] = 'Rust',
  ['chestnut'] = 'Chestnut',
  ['hazelnut'] = 'Hazelnut',
  ['shell'] = 'Shell',
  ['mahogany'] = 'Mahogany',
  ['cauldron'] = 'Cauldron',
  ['blond'] = 'Blond',
  ['gravel'] = 'Gravel',
  ['darkearth'] = 'Dark Earth',
  ['desert'] = 'Desert',
  -- Purple
  ['purple'] = 'purple',
  ['indigo'] = 'Indigo',
  ['deeppurple'] = 'Deep Purple',
  ['darkviolet'] = 'Dark Violet',
  ['amethyst'] = 'Amethyst',
  ['mysticalviolet'] = 'Mystic Violet',
  ['purplemetallic'] = 'Purple Metallic',
  ['matteviolet'] = 'Matte Violet',
  ['mattedeeppurple'] = 'Matte Deep Purple',
  -- Chrome
  ['chrome'] = 'chrome',
  ['brushedchrome'] = 'brushed Chrome',
  ['blackchrome'] = 'black Chrome',
  ['brushedaluminum'] = 'brushed Aluminum',
  -- Metal
  ['gold'] = 'gold',
  ['puregold'] = 'pure Gold',
  ['brushedgold'] = 'brushed Gold',
  ['lightgold'] = 'light Gold',
-- License Plates
  ['blue_on_white_1'] = 'blue on white 1',
  ['yellow_on_black'] = 'yellow on black',
  ['yellow_blue'] = 'yellow on blue',
  ['blue_on_white_2'] = 'blue on white 2',
  ['blue_on_white_3'] = 'blue on white 3',
-- Upgrades
  ['upgrades'] = 'Upgrades',
  ['engine'] = 'Engine',
  ['brakes'] = 'Brakes',
  ['transmission'] = 'Transmission',
  ['suspension'] = 'Suspension',
  ['armor'] = 'Armor',
  ['turbo'] = 'Turbo',
  ['no_turbo'] = 'no turbo',
-- Cosmetics
  ['cosmetics'] = 'cosmetics',
  -- Body Parts
  ['bodyparts'] = 'body Parts',
  ['leftfender'] = 'left fender',
  ['rightfender'] = 'right fender',
  ['spoilers'] = 'spoilers',
  ['sideskirt'] = 'side skirts',
  ['cage'] = 'cage',
  ['hood'] = 'hood',
  ['grille'] = 'grille',
  ['rearbumper'] = 'rear bumper',
  ['frontbumper'] = 'front bumper',
  ['exhaust'] = 'exhaust',
  ['roof'] = 'roof',
  -- Paint
  ['respray'] = 'respray',
  ['primary'] = 'primary',
  ['secondary'] = 'secondary',
  ['pearlescent'] = 'pearlescent',
  -- Misc
  ['headlights'] = 'headlights',
  ['licenseplates'] = 'license Plate',
  ['windowtint'] = 'window Tint',
  ['horns'] = 'horns',
  -- Neon
  ['neons'] = 'neons',
  -- Wheels
  ['wheels'] = 'wheels',
  ['tiresmoke'] = 'tire smoke',
  ['wheel_type'] = 'wheel type',
  ['wheel_color'] = 'wheel color',
  ['sport'] = 'sport',
  ['muscle'] = 'muscle',
  ['lowrider'] = 'lowrider',
  ['suv'] = 'SUV',
  ['allterrain'] = 'all terrain',
  ['tuning'] = 'tuning',
  ["motorcycle"] = "motorcycle Front",
  ["highend"] = "high end",
  ['motorcycle2'] = 'motorcycle Back',
  ['dragster'] = 'dragster',
  ['street'] = 'street',
  ['bennys'] = 'bennys',
  ['bennysv2'] = 'bennys v2',
  ['rally'] = 'race',

  ['modplateholder'] = 'plate - Back',
  ['modvanityplate'] = 'plate - Front',
  ['interior'] = 'interior',
  ['trim'] = 'trim',
  ['dashboard'] = 'dashboard',
  ['speedometer'] = 'speedometer',
  ['door_speakers'] = 'door speakers',
  ['seats'] = 'seats',
  ['steering_wheel'] = 'steering wheel',
  ['gear_lever'] = 'gear lever',
  ['quarter_deck'] = 'quarter-deck',
  ['speakers'] = 'speakers',
  ['trunk'] = 'trunk',
  ['hydraulic'] = 'hydraulic',
  ['engine_block'] = 'engine block',
  ['air_filter'] = 'air filter',
  ['struts'] = 'struts',
  ['arch_cover'] = 'arch cover',
  ['aerials'] = 'aerials',
  ['wings'] = 'wings',
  ['fuel_tank'] = 'fuel tank',
  ['windows'] = 'windows',
  ['stickers'] = 'Livery',

-- Xenon Colors
  ['mintgreen'] = 'Mint Green',
  ['goldenshower'] = 'Golden Shower',
  ['ponypink'] = 'Pony Pink',
  ['hotpink'] = 'Hot Pink',
  ['blacklight'] = 'Blacklight',
}
RegisterNetEvent('fdsdev_lscustom:installMod')
AddEventHandler('fdsdev_lscustom:installMod', function(prezzo)
	prezzofinale = prezzofinale + (prezzo or 0) 
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	myCar = GetVehicleProperties(vehicle)
end)

RegisterNetEvent('fdsdev_lscustom:cancelInstallMod')
AddEventHandler('fdsdev_lscustom:cancelInstallMod', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if (GetPedInVehicleSeat(vehicle, -1) ~= PlayerPedId()) then
		 vehicle = GetPlayersLastVehicle(PlayerPedId())
	end
		SetVehicleProperties(vehicle, myCar)
	if not (myCar.modTurbo) then
		ToggleVehicleMod(vehicle,  18, false)
	end
	if not (myCar.modXenon) then
		ToggleVehicleMod(vehicle,  22, false)
	end
	if not (myCar.windowTint) then
		SetVehicleWindowTint(vehicle, 0)
	end
end)


local eleme, menuNam, menuTitl, parente = {}, {}, {}, {}
local currentKakka = 1
function OpenLSMenu(elems, menuName, menuTitle, parent)
	-- print("[DEBUG] Menu " .. currentKakka)
	lib.registerMenu({
		id = menuName,
		title = menuTitle,
		position = 'bottom-right',
		onSideScroll = function(selected, scrollIndex, args)
			-- print("Scroll: ", selected, scrollIndex, args)
		end,
		onSelected = function(selected, secondary, args)
			if elems[selected] and elems[selected].modType ~= "extras" then
				UpdateMods(elems[selected])
			end
		end,
		onCheck = function(selected, checked, args)
			-- print("Check: ", selected, checked, args)
		end,
		onClose = function(keyPressed)
			if menuName == "main" then
				currentKakka = 1
				local menu = lib.getOpenMenu()
				lib.hideMenu(menu)
				TriggerEvent('fdsdev_lscustom:cancelInstallMod')

				local playerPed = PlayerPedId()
				local vehicle = GetVehiclePedIsIn(playerPed, false)
				SetVehicleDoorsShut(vehicle, false)

				if parent == nil then
					lsMenuIsShowed = false
					if comandomodifica then
						comandomodifica = false
					end
					local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
					FreezeEntityPosition(vehicle, false)
					myCar = {}
				end
			else
				currentKakka = currentKakka - 1
				TriggerEvent('fdsdev_lscustom:cancelInstallMod')
				-- print("[DEBUG] Menu " .. currentKakka)
				OpenLSMenu(eleme[currentKakka], menuNam[currentKakka], menuTitl[currentKakka], parente[currentKakka])
			end
		end,
		options = elems
	}, function(selected, scrollIndex, args)
		eleme[currentKakka], menuNam[currentKakka], menuTitl[currentKakka], parente[currentKakka] = elems, menuName, menuTitle, parent
		currentKakka = currentKakka + 1
		local isRimMod, found = false, false
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		local data = {}
		data.current = elems[selected]
		if elems[selected].modType == "modFrontWheels" then
			isRimMod = true
		end

		for k,v in pairs(varmechanic.Menus) do

			if k == elems[selected].modType or isRimMod then
				if elems[selected].label == GetLocale('by_default') or elems[selected].iconColor == "#68a84a" then
					-- print("[DEBUG] Menu " .. currentKakka)
					if v.modType == "extras" then
						currentKakka = currentKakka - 1
						
						local vehiclePrice = 0
						local props = {}
						props["extras"] = {}
						props["extras"][data.current.modNum] = not data.current.modBool
						SetVehicleProperties(vehicle, props)
						price = math.floor(vehiclePrice * v.price / 100)
						if not comandomodifica then
							TriggerServerEvent('fdsdev_lscustom:buyMod', price)
						else
							TriggerServerEvent('fdsdev_lscustom:buyMod', 0)	
						end
						print("[Debug] Linea 517")
						GetAction({label = "Extra", value = "extras", icon = "fas fa-car"})
						-- menu.close()
						return
					end
					currentKakka = currentKakka - 2
					OpenLSMenu(eleme[currentKakka], menuNam[currentKakka], menuTitl[currentKakka], parente[currentKakka])
					print(GetLocale('already_own', data.current.label))

					-- qui
					
					TriggerEvent('fdsdev_lscustom:installMod')
				else
					local vehiclePrice = 0
					-- print("[DEBUG] Menu " .. currentKakka)
					if isRimMod then
						price = math.floor(vehiclePrice * data.current.price / 100)
						if not comandomodifica then
							TriggerServerEvent('fdsdev_lscustom:buyMod', price)
						else
							TriggerServerEvent('fdsdev_lscustom:buyMod', 0)	
						end
					elseif v.modType == 11 or v.modType == 12 or v.modType == 13 or v.modType == 15 or v.modType == 16 then
						if v.price[data.current.modNum + 1] then
							price = math.floor(vehiclePrice * v.price[data.current.modNum + 1] / 100)
							if not comandomodifica then
								TriggerServerEvent('fdsdev_lscustom:buyMod', price)
							else
								TriggerServerEvent('fdsdev_lscustom:buyMod', 0)	
							end
						else
							TriggerServerEvent('fdsdev_lscustom:buyMod', 0)	
						end
					elseif v.modType == 17 then
						price = math.floor(vehiclePrice * v.price[1] / 100)
						if not comandomodifica then
							TriggerServerEvent('fdsdev_lscustom:buyMod', price)
						else
							TriggerServerEvent('fdsdev_lscustom:buyMod', 0)	
						end
					elseif v.modType == "extras" then
						if data.current.label ~= "No extra found" then
							local props = {}
							props["extras"] = {}
							props["extras"][data.current.modNum] = data.current.modBool
							SetVehicleProperties(vehicle, props)
							price = math.floor(vehiclePrice * v.price / 100)
							if not comandomodifica then
								TriggerServerEvent('fdsdev_lscustom:buyMod', price)
							else
								TriggerServerEvent('fdsdev_lscustom:buyMod', 0)	
							end
							-- menu.close()
							currentKakka = currentKakka - 1
							GetAction({label = "Extra", value = "extras", icon = "fas fa-car"})
							return
						end
					else
						price = math.floor(vehiclePrice * v.price / 100)
						if not comandomodifica then
							TriggerServerEvent('fdsdev_lscustom:buyMod', price)
						else
							TriggerServerEvent('fdsdev_lscustom:buyMod', 0)	
						end
					end
					if v.modType == "extras" then
					else
						currentKakka = currentKakka - 2
						OpenLSMenu(eleme[currentKakka], menuNam[currentKakka], menuTitl[currentKakka], parente[currentKakka])
					end
				end

				-- menu.close()
				found = true
				break
			end

		end

		if not found then
			-- print("ciao")
			GetAction(data.current)
		end
		-- GetAction({value = elems[selected].value})
	end)
	lib.showMenu(menuName)
end

function UpdateMods(data)
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if data.modType then
		local props = {}
		
		if data.wheelType then
			props['wheels'] = data.wheelType
			SetVehicleProperties(vehicle, props)
			props = {}
		elseif data.modType == 'neonColor' then
			-- print(json.encode(data))
			if data.modNum[1] == 0 and data.modNum[2] == 0 and data.modNum[3] == 0 then
				props['neonEnabled'] = { false, false, false, false }
			else
				props['neonEnabled'] = { true, true, true, true }
			end
			SetVehicleProperties(vehicle, props)
			props = {}
		elseif data.modType == 'tyreSmokeColor' then
			props['modSmokeEnabled'] = true
			SetVehicleProperties(vehicle, props)
			props = {}
		end
		-- print(data.modType, data.modNum)
		if data.modType == -1 then else
			-- print(data.modType, data.modNum)
			props[data.modType] = data.modNum
		end
		SetVehicleProperties(vehicle, props)
	end
end

function GetAction(data)
	local elements  = {}
	local menuName  = ''
	local menuTitle = ''
	local parent    = nil

	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	local currentMods = GetVehicleProperties(vehicle)
	-- print(json.encode(data))
	-- print(GetVehicleNumberPlateText(vehicle))

	if data.value == 'modSpeakers' or
		data.value == 'modTrunk' or
		data.value == 'modHydrolic' or
		data.value == 'modEngineBlock' or
		data.value == 'modAirFilter' or
		data.value == 'modStruts' or
		data.value == 'modTank' then
		SetVehicleDoorOpen(vehicle, 4, false)
		SetVehicleDoorOpen(vehicle, 5, false)
	elseif data.value == 'modDoorSpeaker' then
		SetVehicleDoorOpen(vehicle, 0, false)
		SetVehicleDoorOpen(vehicle, 1, false)
		SetVehicleDoorOpen(vehicle, 2, false)
		SetVehicleDoorOpen(vehicle, 3, false)
	else
		SetVehicleDoorsShut(vehicle, false)
	end

	local vehiclePrice = 0
	local autorizzato = true
	for k,v in pairs(varmechanic.Menus) do

		if data.value == k then

			menuName  = k
			menuTitle = v.label
			parent    = v.parent
			if v.modType then

				if v.modType == 'windowTint' then -- WINDOWS TINT
					for j = 1, 5, 1 do
						local _label = ''
						if j == currentMods.windowTint then
							_label = GetWindowName(j)
						else
							price = math.floor(vehiclePrice * v.price / 100)
							_label = GetWindowName(j) 
						end
						table.insert(elements, {label = _label, modType = k, modNum = j, icon = "fas fa-wrench", iconColor = (j == currentMods.windowTint) and "#68a84a" or "white"})
					end
				end
				if autorizzato then
					if v.label == "Extra" then
						if json.encode(currentMods.extras) == "[]" then
							table.insert(elements, {label = "No extra found", modType = k, modNum = false, icon = "fas fa-minus-circle"})
						end
						for kappa,vu in pairs(currentMods.extras) do
							if vu then
								_label = 'Extra '..kappa 
							else
								price = math.floor(vehiclePrice * v.price / 100)
								_label = 'Extra '..kappa 
							end
							table.insert(elements, {label = _label, modType = "extras", modNum = kappa, modBool = true, icon = "fas fa-wrench", iconColor = vu == 1 and "#68a84a" or "white"})
						end
					end
					if v.modType == 22 then
						table.insert(elements, {label = " " .. GetLocale('by_default'), modType = k, modNum = false})
					elseif v.modType == 'neonColor' or v.modType == 'tyreSmokeColor' then -- disable neon
						-- print(k, GetLocale('by_default'))
						table.insert(elements, {label = " " ..  GetLocale('by_default'), modType = k, modNum = {0, 0, 0}})
					elseif v.modType == 'color1' or v.modType == 'interiorcolor' or v.modType == 'dashboardcolor' or v.modType == 'color2' or v.modType == 'pearlescentColor' or v.modType == 'wheelColor' then
						local num = myCar[v.modType]
						table.insert(elements, {label = " " .. GetLocale('by_default'), modType = k, modNum = num})
					elseif v.modType == 17 then
						elements[#elements + 1] = {defaultIndex = 1, icon = "fas fa-minus-circle", iconColor = "#d93232", defaultIndex = 1, label = "Remove turbo", modType = k, modNum = false}
						table.insert(elements, {label = "Turbo liv. 1", modType = k, iconColor = currentMods[k] and "#68a84a" or "white", icon = "fas fa-wrench", modNum = true})
					end
					if v.modType == 14 then -- HORNS
						for j = 0, 51, 1 do
							local _label = ''
							if j == currentMods.modHorns then
								_label = GetHornName(j) 
							else
								price = math.floor(vehiclePrice * v.price / 100)
								_label = GetHornName(j) 
							end
							table.insert(elements, {label = _label, modType = k, modNum = j, icon = "fas fa-wrench", iconColor = (j == currentMods.modHorns) and "#68a84a" or "white"})
						end
					elseif v.modType == 'plateIndex' then -- PLATES
						for j = 0, 4, 1 do
							local _label = ''
							if j == currentMods.plateIndex then
								_label = GetPlatesName(j) 
							else
								price = math.floor(vehiclePrice * v.price / 100)
								_label = GetPlatesName(j) 
							end
							table.insert(elements, {label = _label, modType = k, modNum = j, icon = "fas fa-wrench", iconColor = (j == currentMods.plateIndex) and "#68a84a" or "white"})
						end
					elseif v.modType == 22 then -- NEON
						local _label = ''
						if currentMods.modXenon then
							_label = GetLocale('neon')
						else
							price = math.floor(vehiclePrice * v.price / 100)
							_label = GetLocale('neon') 
						end
						table.insert(elements, {label = _label, modType = k, modNum = true, icon = "fas fa-wrench", iconColor = (currentMods.modXenon) and "#68a84a" or "white"})
					elseif v.modType == 'neonColor' or v.modType == 'tyreSmokeColor' then -- NEON & SMOKE COLOR
						local neons = GetNeons()
						-- price = math.floor(vehiclePrice * v.price / 100)
						for i=1, #neons, 1 do
							table.insert(elements, {
								label = neons[i].label,
								modType = k,
								modNum = { neons[i].r, neons[i].g, neons[i].b }
							})
						end
					elseif v.modType == 'color1' or v.modType == 'color2' or v.modType == 'dashboardcolor' or v.modType == 'interiorcolor' or v.modType == 'pearlescentColor' or v.modType == 'wheelColor' then -- RESPRAYS
						local colors = GetColors(data.color)
						for j = 1, #colors, 1 do
							local _label = ''
							price = math.floor(vehiclePrice * v.price / 100)
							_label = colors[j].label 
							table.insert(elements, {label = _label, modType = k, modNum = colors[j].index})
						end
					elseif v.modType == 23 then -- WHEELS RIM & TYPE
						local props = {}

						props['wheels'] = v.wheelType
						SetVehicleProperties(GetVehiclePedIsIn(PlayerPedId(), false), props)

						local modCount = GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), false), v.modType)
						for j = 0, modCount, 1 do
							local modName = GetModTextLabel(GetVehiclePedIsIn(PlayerPedId(), false), v.modType, j)
							if modName then
								local _label = ''
								if j == currentMods.modFrontWheels then
									_label = GetLabelText(modName)
								else
									price = math.floor(vehiclePrice * v.price / 100)
									_label = GetLabelText(modName) 
								end
								table.insert(elements, {label = _label, modType = 'modFrontWheels', modNum = j, wheelType = v.wheelType, price = v.price, icon = "fas fa-wrench", iconColor = (j == currentMods.modFrontWheels) and "#68a84a" or "white"})
							end
						end
					elseif v.modType == 11 or v.modType == 12 or v.modType == 13 or v.modType == 15 or v.modType == 16 then
						SetVehicleModKit(GetVehiclePedIsIn(PlayerPedId(), false), 0)
						local modCount = GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), false), v.modType) -- UPGRADES
						elements[#elements + 1] = {defaultIndex = 1, icon = "fas fa-minus-circle", iconColor = "#d93232", label = "Default", modType = k, modNum = -1}
						for j = 0, modCount, 1 do
							local _label = ''
							if j == currentMods[k] then
								_label = GetLocale('level', j+1)
							else
								price = 0
								_label = GetLocale('level', j+1) 
							end
							table.insert(elements, {label = _label, modType = k, modNum = j, icon = "fas fa-wrench", iconColor = (j == currentMods[k]) and "#68a84a" or "white"})
							if j == modCount-1 then
								break
							end
						end
					elseif v.modType == "modLivery" then -- TURBO
						elements[#elements + 1] = {icon = "fas fa-minus-circle", iconColor = "#d93232", label = "Default", modType = "modLivery", modNum = -1}
						elements[#elements + 1] = {icon = "fas fa-minus-circle", iconColor = "#d93232", label = "Default 2", modType = "modLivery", modNum = 0}
						for i=1, GetVehicleLiveryCount(GetVehiclePedIsIn(PlayerPedId(), false)), 1 do
							if GetVehicleLivery(GetVehiclePedIsIn(PlayerPedId(), false)) ~= -1 and GetVehicleLivery(GetVehiclePedIsIn(PlayerPedId(), false)) == i then
								table.insert(elements, {label = "Livery " .. i, modType = "modLivery", modNum = i, icon = "fas fa-palette", iconColor = "#68a84a"})
							else
								table.insert(elements, {label = "Livery " .. i, modType = "modLivery", modNum = i, icon = "fas fa-palette", iconColor = "white"})
							end
						end
					elseif v.modType ~= 17 then
						local modCount = GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), false), v.modType) -- BODYPARTS
						elements[#elements + 1] = {defaultIndex = 1, icon = "fas fa-minus-circle", iconColor = "#d93232", defaultIndex = 1, label = "Default", modType = k, modNum = -1}
						-- print(json.encode(elements))
						for j = 0, modCount, 1 do
							local modName = GetModTextLabel(GetVehiclePedIsIn(PlayerPedId(), false), v.modType, j)
							if modName then
								local _label = ''
								if j == currentMods[k] then
									_label = GetLabelText(modName)
								else
									price = math.floor(vehiclePrice * v.price / 100)
									_label = GetLabelText(modName) 
								end
								elements[#elements + 1] = {label = _label, modType = k, modNum = j, icon = "fas fa-wrench", iconColor = (j == currentMods[k]) and "#68a84a" or "white"}
							end
						end
					end
				end
			else
				if autorizzato and (data.value == 'primaryRespray' or data.value == 'interiorRespray' or data.value == 'dashboardRespray' or data.value == 'secondaryRespray' or data.value == 'pearlescentRespray' or data.value == 'modFrontWheelsColor') then
					for i=1, #varmechanic.Colors, 1 do
						if data.value == 'primaryRespray' then
							table.insert(elements, {label = varmechanic.Colors[i].label, value = 'color1', color = varmechanic.Colors[i].value})
						elseif data.value == 'secondaryRespray' then
							table.insert(elements, {label = varmechanic.Colors[i].label, value = 'color2', color = varmechanic.Colors[i].value})
						elseif data.value == 'dashboardRespray' then
							table.insert(elements, {label = varmechanic.Colors[i].label, value = 'dashboardcolor', color = varmechanic.Colors[i].value})
						elseif data.value == 'interiorRespray' then
							table.insert(elements, {label = varmechanic.Colors[i].label, value = 'interiorcolor', color = varmechanic.Colors[i].value})
						elseif data.value == 'pearlescentRespray' then
							table.insert(elements, {label = varmechanic.Colors[i].label, value = 'pearlescentColor', color = varmechanic.Colors[i].value})
						elseif data.value == 'modFrontWheelsColor' then
							table.insert(elements, {label = varmechanic.Colors[i].label, value = 'wheelColor', color = varmechanic.Colors[i].value})
						end
					end
				else
					local dovrebbe = false
					local contoMod = 0
					for l,w in pairs(v) do
						if l ~= 'label' and l ~= 'parent' and l ~= 'icon' then
							-- print(l)
							SetVehicleModKit(GetVehiclePedIsIn(PlayerPedId(), false), 0)
							if varmechanic.Menus[l] and varmechanic.Menus[l].modType and k ~= "main" then
								-- print(l)
								if varmechanic.Menus[l].modType == 22 
								or varmechanic.Menus[l].modType == 'neonColor' 
								or varmechanic.Menus[l].modType == 'tyreSmokeColor'
								or varmechanic.Menus[l].modType == 'color1' 
								or varmechanic.Menus[l].modType == 'interiorcolor' 
								or varmechanic.Menus[l].modType == 'dashboardcolor' 
								or varmechanic.Menus[l].modType == 'color2' 
								or varmechanic.Menus[l].modType == 'pearlescentColor' 
								or varmechanic.Menus[l].modType == 'wheelColor' 
								or varmechanic.Menus[l].modType == 14
								or varmechanic.Menus[l].modType == 'plateIndex'
								or varmechanic.Menus[l].modType == 22
								or varmechanic.Menus[l].modType == 'color1' 
								or varmechanic.Menus[l].modType == 'color2' 
								or varmechanic.Menus[l].modType == 'dashboardcolor'
								or varmechanic.Menus[l].modType == 'interiorcolor'
								or varmechanic.Menus[l].modType == 'pearlescentColor' 
								or varmechanic.Menus[l].modType == 'wheelColor'
								or varmechanic.Menus[l].modType == 'windowTint'
								or varmechanic.Menus[l].modType == 17 then
									table.insert(elements, {label = w, value = l, icon = varmechanic.Menus[l].icon or "fas fa-car"})
								elseif varmechanic.Menus[l].label == "Extra" then
									if json.encode(currentMods.extras) == "[]" then
									else
										table.insert(elements, {label = w, value = l, icon = varmechanic.Menus[l].icon or "fas fa-car"})
									end
								elseif varmechanic.Menus[l].modType == "modLivery" then
									if GetVehicleLiveryCount(GetVehiclePedIsIn(PlayerPedId())) == 0 then
									else
										table.insert(elements, {label = w, value = l, icon = varmechanic.Menus[l].icon or "fas fa-car"})
									end
								else
									-- print(GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), false), varmechanic.Menus[l].modType), varmechanic.Menus[l].modType)
									local modCount = GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), false), varmechanic.Menus[l].modType) -- BODYPARTS
									if modCount == 0 then
									else
										contoMod = contoMod + 1
										table.insert(elements, {label = w, value = l, icon = varmechanic.Menus[l].icon or "fas fa-car"})
									end
								end

								


								

								
								-- elseif v.modType == 23 then -- WHEELS RIM & TYPE
								-- 	local props = {}
			
								-- 	props['wheels'] = v.wheelType
								-- 	SetVehicleProperties(vehicle, props)
			
								-- 	local modCount = GetNumVehicleMods(vehicle, v.modType)
								-- 	for j = 0, modCount, 1 do
								-- 		local modName = GetModTextLabel(vehicle, v.modType, j)
								-- 		if modName then
								-- 			local _label = ''
								-- 			if j == currentMods.modFrontWheels then
								-- 				_label = GetLabelText(modName) .. ' - Installato'
								-- 			else
								-- 				price = math.floor(vehiclePrice * v.price / 100)
								-- 				_label = GetLabelText(modName) 
								-- 			end
								-- 			table.insert(elements, {label = _label, modType = 'modFrontWheels', modNum = j, wheelType = v.wheelType, price = v.price})
								-- 		end
								-- 	end
								-- elseif v.modType == 11 or v.modType == 12 or v.modType == 13 or v.modType == 15 or v.modType == 16 then
								-- 	SetVehicleModKit(vehicle, 0)
								-- 	local modCount = GetNumVehicleMods(vehicle, v.modType) -- UPGRADES
								-- 	table.insert(elements, {label = "Default", modType = k, modNum = -1})
								-- 	for j = 0, modCount, 1 do
								-- 		local _label = ''
								-- 		if j == currentMods[k] then
								-- 			_label = GetLocale('level', j+1) .. ' - Installato'
								-- 		else
								-- 			price = math.floor(vehiclePrice * v.price[j+1] / 100)
								-- 			_label = GetLocale('level', j+1) 
								-- 		end
								-- 		table.insert(elements, {label = _label, modType = k, modNum = j})
								-- 		if j == modCount-1 then
								-- 			break
								-- 		end
								-- 	end
								-- elseif v.modType == 17 then -- TURBO
								-- 	local _label = ''
								-- 	if currentMods[k] then
								-- 		_label = 'Turbo - <span style="color:cornflowerblue;">'.. GetLocale('installed') ..'</i>'
								-- 	else
								-- 		_label = 'Turbo - <span style="color:green;">$' .. math.floor(vehiclePrice * v.price[1] / 100) .. ' </i>'
								-- 	end
								-- 	table.insert(elements, {label = _label, modType = k, modNum = true})
								-- else
								-- 	local modCount = GetNumVehicleMods(vehicle, v.modType) -- BODYPARTS
								-- 	elements[#elements + 1] = {label = "Default", modType = k, modNum = -1}
								-- 	for j = 0, modCount, 1 do
								-- 		local modName = GetModTextLabel(vehicle, v.modType, j)
								-- 		if modName then
								-- 			local _label = ''
								-- 			if j == currentMods[k] then
								-- 				_label = GetLabelText(modName) .. ' - Installato'
								-- 			else
								-- 				price = math.floor(vehiclePrice * v.price / 100)
								-- 				_label = GetLabelText(modName) 
								-- 			end
								-- 			elements[#elements + 1] = {label = _label, modType = k, modNum = j}
								-- 		end
								-- 	end
								-- end
							else
								-- print("[Fuori] " .. l)
								if l == "bodyparts" then
									local numTotale = 0
									for kee,vaa in pairs(varmechanic.Menus[l]) do
										if kee ~= "label" and kee ~= "parent" then
											local modCount = GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), false), varmechanic.Menus[kee].modType) -- BODYPARTS
											-- print("[Debug] Bodyparts check MODCOUNT " .. modCount .. "(".. varmechanic.Menus[kee].modType ..")")
											if modCount == 0 then
											else
												numTotale = numTotale + 1
											end	
										end
									end

									if numTotale > 0 then
										table.insert(elements, {label = w, value = l, icon = (varmechanic.Menus[l] and varmechanic.Menus[l].icon) or "fas fa-car"})
									end
								else
									table.insert(elements, {label = w, value = l, icon = (varmechanic.Menus[l] and varmechanic.Menus[l].icon) or "fas fa-car"})
								end
							end

							-- print("[Debug] Il conto totale delle mod è " .. contoMod .. ", " .. tostring(dovrebbe) .. " , " .. menuName)
							-- if contoMod == 0 and menuName == "cosmetics" then
							-- 	Citizen.Wait(1000)
							-- 	GetAction({label = "Estetica", icon = "fas fa-palette", value = "cosmetics"})
							-- 	GetAction({label = "Estetica", icon = "fas fa-palette", value = "cosmetics"})
							-- 	return
							-- end
						end
					end
				end
			end
			break
		end
	end

	-- table.sort(elements, function(a, b)
	-- 	return a.label < b.label
	-- end)

	OpenLSMenu(elements, menuName, menuTitle, parent)
end
----variabols varmechanics
varmechanic                   = {}
varmechanic.DrawDistance      = 100.0
varmechanic.Locale            = 'en'
varmechanic.IsMechanicJobOnly = false

varmechanic.Colors = {
	{label = GetLocale('black'), value = 'black'},
	{label = GetLocale('white'), value = 'white'},
	{label = GetLocale('grey'), value = 'grey'},
	{label = GetLocale('red'), value = 'red'},
	{label = GetLocale('pink'), value = 'pink'},
	{label = GetLocale('blue'), value = 'blue'},
	{label = GetLocale('yellow'), value = 'yellow'},
	{label = GetLocale('green'), value = 'green'},
	{label = GetLocale('orange'), value = 'orange'},
	{label = GetLocale('brown'), value = 'brown'},
	{label = GetLocale('purple'), value = 'purple'},
	{label = GetLocale('chrome'), value = 'chrome'},
	{label = GetLocale('gold'), value = 'gold'}
}

function GetColors(color)
	local colors = {}
	if color == 'black' then
		colors = {
			{ index = 0, label = GetLocale('black')},
			{ index = 1, label = GetLocale('graphite')},
			{ index = 2, label = GetLocale('black_metallic')},
			{ index = 3, label = GetLocale('caststeel')},
			{ index = 11, label = GetLocale('black_anth')},
			{ index = 12, label = GetLocale('matteblack')},
			{ index = 15, label = GetLocale('darknight')},
			{ index = 16, label = GetLocale('deepblack')},
			{ index = 21, label = GetLocale('oil')},
			{ index = 147, label = GetLocale('carbon')}
		}
	elseif color == 'white' then
		colors = {
			{ index = 106, label = GetLocale('vanilla')},
			{ index = 107, label = GetLocale('creme')},
			{ index = 111, label = GetLocale('white')},
			{ index = 112, label = GetLocale('polarwhite')},
			{ index = 113, label = GetLocale('beige')},
			{ index = 121, label = GetLocale('mattewhite')},
			{ index = 122, label = GetLocale('snow')},
			{ index = 131, label = GetLocale('cotton')},
			{ index = 132, label = GetLocale('alabaster')},
			{ index = 134, label = GetLocale('purewhite')}
		}
	elseif color == 'grey' then
		colors = {
			{ index = 4, label = GetLocale('silver')},
			{ index = 5, label = GetLocale('metallicgrey')},
			{ index = 6, label = GetLocale('laminatedsteel')},
			{ index = 7, label = GetLocale('darkgray')},
			{ index = 8, label = GetLocale('rockygray')},
			{ index = 9, label = GetLocale('graynight')},
			{ index = 10, label = GetLocale('aluminum')},
			{ index = 13, label = GetLocale('graymat')},
			{ index = 14, label = GetLocale('lightgrey')},
			{ index = 17, label = GetLocale('asphaltgray')},
			{ index = 18, label = GetLocale('grayconcrete')},
			{ index = 19, label = GetLocale('darksilver')},
			{ index = 20, label = GetLocale('magnesite')},
			{ index = 22, label = GetLocale('nickel')},
			{ index = 23, label = GetLocale('zinc')},
			{ index = 24, label = GetLocale('dolomite')},
			{ index = 25, label = GetLocale('bluesilver')},
			{ index = 26, label = GetLocale('titanium')},
			{ index = 66, label = GetLocale('steelblue')},
			{ index = 93, label = GetLocale('champagne')},
			{ index = 144, label = GetLocale('grayhunter')},
			{ index = 156, label = GetLocale('grey')}
		}
	elseif color == 'red' then
		colors = {
			{ index = 27, label = GetLocale('red')},
			{ index = 28, label = GetLocale('torino_red')},
			{ index = 29, label = GetLocale('poppy')},
			{ index = 30, label = GetLocale('copper_red')},
			{ index = 31, label = GetLocale('cardinal')},
			{ index = 32, label = GetLocale('brick')},
			{ index = 33, label = GetLocale('garnet')},
			{ index = 34, label = GetLocale('cabernet')},
			{ index = 35, label = GetLocale('candy')},
			{ index = 39, label = GetLocale('matte_red')},
			{ index = 40, label = GetLocale('dark_red')},
			{ index = 43, label = GetLocale('red_pulp')},
			{ index = 44, label = GetLocale('bril_red')},
			{ index = 46, label = GetLocale('pale_red')},
			{ index = 143, label = GetLocale('wine_red')},
			{ index = 150, label = GetLocale('volcano')}
		}
	elseif color == 'pink' then
		colors = {
			{ index = 135, label = GetLocale('electricpink')},
			{ index = 136, label = GetLocale('salmon')},
			{ index = 137, label = GetLocale('sugarplum')}
		}
	elseif color == 'blue' then
		colors = {
			{ index = 54, label = GetLocale('topaz')},
			{ index = 60, label = GetLocale('light_blue')},
			{ index = 61, label = GetLocale('galaxy_blue')},
			{ index = 62, label = GetLocale('dark_blue')},
			{ index = 63, label = GetLocale('azure')},
			{ index = 64, label = GetLocale('navy_blue')},
			{ index = 65, label = GetLocale('lapis')},
			{ index = 67, label = GetLocale('blue_diamond')},
			{ index = 68, label = GetLocale('surfer')},
			{ index = 69, label = GetLocale('pastel_blue')},
			{ index = 70, label = GetLocale('celeste_blue')},
			{ index = 73, label = GetLocale('rally_blue')},
			{ index = 74, label = GetLocale('blue_paradise')},
			{ index = 75, label = GetLocale('blue_night')},
			{ index = 77, label = GetLocale('cyan_blue')},
			{ index = 78, label = GetLocale('cobalt')},
			{ index = 79, label = GetLocale('electric_blue')},
			{ index = 80, label = GetLocale('horizon_blue')},
			{ index = 82, label = GetLocale('metallic_blue')},
			{ index = 83, label = GetLocale('aquamarine')},
			{ index = 84, label = GetLocale('blue_agathe')},
			{ index = 85, label = GetLocale('zirconium')},
			{ index = 86, label = GetLocale('spinel')},
			{ index = 87, label = GetLocale('tourmaline')},
			{ index = 127, label = GetLocale('paradise')},
			{ index = 140, label = GetLocale('bubble_gum')},
			{ index = 141, label = GetLocale('midnight_blue')},
			{ index = 146, label = GetLocale('forbidden_blue')},
			{ index = 157, label = GetLocale('glacier_blue')}
		}
	elseif color == 'yellow' then
		colors = {
			{ index = 42, label = GetLocale('yellow')},
			{ index = 88, label = GetLocale('wheat')},
			{ index = 89, label = GetLocale('raceyellow')},
			{ index = 91, label = GetLocale('paleyellow')},
			{ index = 126, label = GetLocale('lightyellow')}
		}
	elseif color == 'green' then
		colors = {
			{ index = 49, label = GetLocale('met_dark_green')},
			{ index = 50, label = GetLocale('rally_green')},
			{ index = 51, label = GetLocale('pine_green')},
			{ index = 52, label = GetLocale('olive_green')},
			{ index = 53, label = GetLocale('light_green')},
			{ index = 55, label = GetLocale('lime_green')},
			{ index = 56, label = GetLocale('forest_green')},
			{ index = 57, label = GetLocale('lawn_green')},
			{ index = 58, label = GetLocale('imperial_green')},
			{ index = 59, label = GetLocale('green_bottle')},
			{ index = 92, label = GetLocale('citrus_green')},
			{ index = 125, label = GetLocale('green_anis')},
			{ index = 128, label = GetLocale('khaki')},
			{ index = 133, label = GetLocale('army_green')},
			{ index = 151, label = GetLocale('dark_green')},
			{ index = 152, label = GetLocale('hunter_green')},
			{ index = 155, label = GetLocale('matte_foilage_green')}
		}
	elseif color == 'orange' then
		colors = {
			{ index = 36, label = GetLocale('tangerine')},
			{ index = 38, label = GetLocale('orange')},
			{ index = 41, label = GetLocale('matteorange')},
			{ index = 123, label = GetLocale('lightorange')},
			{ index = 124, label = GetLocale('peach')},
			{ index = 130, label = GetLocale('pumpkin')},
			{ index = 138, label = GetLocale('orangelambo')}
		}
	elseif color == 'brown' then
		colors = {
			{ index = 45, label = GetLocale('copper')},
			{ index = 47, label = GetLocale('lightbrown')},
			{ index = 48, label = GetLocale('darkbrown')},
			{ index = 90, label = GetLocale('bronze')},
			{ index = 94, label = GetLocale('brownmetallic')},
			{ index = 95, label = GetLocale('expresso')},
			{ index = 96, label = GetLocale('chocolate')},
			{ index = 97, label = GetLocale('terracotta')},
			{ index = 98, label = GetLocale('marble')},
			{ index = 99, label = GetLocale('sand')},
			{ index = 100, label = GetLocale('sepia')},
			{ index = 101, label = GetLocale('bison')},
			{ index = 102, label = GetLocale('palm')},
			{ index = 103, label = GetLocale('caramel')},
			{ index = 104, label = GetLocale('rust')},
			{ index = 105, label = GetLocale('chestnut')},
			{ index = 108, label = GetLocale('brown')},
			{ index = 109, label = GetLocale('hazelnut')},
			{ index = 110, label = GetLocale('shell')},
			{ index = 114, label = GetLocale('mahogany')},
			{ index = 115, label = GetLocale('cauldron')},
			{ index = 116, label = GetLocale('blond')},
			{ index = 129, label = GetLocale('gravel')},
			{ index = 153, label = GetLocale('darkearth')},
			{ index = 154, label = GetLocale('desert')}
		}
	elseif color == 'purple' then
		colors = {
			{ index = 71, label = GetLocale('indigo')},
			{ index = 72, label = GetLocale('deeppurple')},
			{ index = 76, label = GetLocale('darkviolet')},
			{ index = 81, label = GetLocale('amethyst')},
			{ index = 142, label = GetLocale('mysticalviolet')},
			{ index = 145, label = GetLocale('purplemetallic')},
			{ index = 148, label = GetLocale('matteviolet')},
			{ index = 149, label = GetLocale('mattedeeppurple')}
		}
	elseif color == 'chrome' then
		colors = {
			{ index = 117, label = GetLocale('brushedchrome')},
			{ index = 118, label = GetLocale('blackchrome')},
			{ index = 119, label = GetLocale('brushedaluminum')},
			{ index = 120, label = GetLocale('chrome')}
		}
	elseif color == 'gold' then
		colors = {
			{ index = 37, label = GetLocale('gold')},
			{ index = 158, label = GetLocale('puregold')},
			{ index = 159, label = GetLocale('brushedgold')},
			{ index = 160, label = GetLocale('lightgold')}
		}
	end
	return colors
end

RegisterCommand("livreano", function()
	local ped = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(ped)
	SetVehicleProperties(vehicle, {
		modLivery = 0
	})
end)

function GetWindowName(index)
	if (index == 1) then
		return "Black"
	elseif (index == 2) then
		return "Dark smoke"
	elseif (index == 3) then
		return "Light smoke"
	elseif (index == 4) then
		return "Limo"
	elseif (index == 5) then
		return "Green"
	else
		return "Unknown"
	end
end

function GetHornName(index)
	if (index == 0) then
		return "Truck Horn"
	elseif (index == 1) then
		return "Cop Horn"
	elseif (index == 2) then
		return "Clown Horn"
	elseif (index == 3) then
		return "Musical Horn 1"
	elseif (index == 4) then
		return "Musical Horn 2"
	elseif (index == 5) then
		return "Musical Horn 3"
	elseif (index == 6) then
		return "Musical Horn 4"
	elseif (index == 7) then
		return "Musical Horn 5"
	elseif (index == 8) then
		return "Sad Trombone"
	elseif (index == 9) then
		return "Classical Horn 1"
	elseif (index == 10) then
		return "Classical Horn 2"
	elseif (index == 11) then
		return "Classical Horn 3"
	elseif (index == 12) then
		return "Classical Horn 4"
	elseif (index == 13) then
		return "Classical Horn 5"
	elseif (index == 14) then
		return "Classical Horn 6"
	elseif (index == 15) then
		return "Classical Horn 7"
	elseif (index == 16) then
		return "Scale - Do"
	elseif (index == 17) then
		return "Scale - Re"
	elseif (index == 18) then
		return "Scale - Mi"
	elseif (index == 19) then
		return "Scale - Fa"
	elseif (index == 20) then
		return "Scale - Sol"
	elseif (index == 21) then
		return "Scale - La"
	elseif (index == 22) then
		return "Scale - Ti"
	elseif (index == 23) then
		return "Scale - Do"
	elseif (index == 24) then
		return "Jazz Horn 1"
	elseif (index == 25) then
		return "Jazz Horn 2"
	elseif (index == 26) then
		return "Jazz Horn 3"
	elseif (index == 27) then
		return "Jazz Horn Loop"
	elseif (index == 28) then
		return "Star igled Banner 1"
	elseif (index == 29) then
		return "Star igled Banner 2"
	elseif (index == 30) then
		return "Star igled Banner 3"
	elseif (index == 31) then
		return "Star igled Banner 4"
	elseif (index == 32) then
		return "Classical Horn 8 Loop"
	elseif (index == 33) then
		return "Classical Horn 9 Loop"
	elseif (index == 34) then
		return "Classical Horn 10 Loop"
	elseif (index == 35) then
		return "Classical Horn 8"
	elseif (index == 36) then
		return "Classical Horn 9"
	elseif (index == 37) then
		return "Classical Horn 10"
	elseif (index == 38) then
		return "Funeral Loop"
	elseif (index == 39) then
		return "Funeral"
	elseif (index == 40) then
		return "Spooky Loop"
	elseif (index == 41) then
		return "Spooky"
	elseif (index == 42) then
		return "San Andreas Loop"
	elseif (index == 43) then
		return "San Andreas"
	elseif (index == 44) then
		return "Liberty City Loop"
	elseif (index == 45) then
		return "Liberty City"
	elseif (index == 46) then
		return "Festive 1 Loop"
	elseif (index == 47) then
		return "Festive 1"
	elseif (index == 48) then
		return "Festive 2 Loop"
	elseif (index == 49) then
		return "Festive 2"
	elseif (index == 50) then
		return "Festive 3 Loop"
	elseif (index == 51) then
		return "Festive 3"
	else
		return "Unknown Horn"
	end
end

function GetNeons()
	local neons = {
		{label = GetLocale('white'),		r = 255, 	g = 255, 	b = 255},
		{label = "Slate Gray",		r = 112, 	g = 128, 	b = 144},
		{label = "Blue",			r = 0, 		g = 0, 		b = 255},
		{label = "Light Blue",		r = 0, 		g = 150, 	b = 255},
		{label = "Navy Blue", 		r = 0, 		g = 0, 		b = 128},
		{label = "Sky Blue", 		r = 135, 	g = 206, 	b = 235},
		{label = "Turquoise", 		r = 0, 		g = 245, 	b = 255},
		{label = "Mint Green", 	r = 50, 	g = 255, 	b = 155},
		{label = "Lime Green", 	r = 0, 		g = 255, 	b = 0},
		{label = "Olive", 			r = 128, 	g = 128, 	b = 0},
		{label = GetLocale('yellow'), 	r = 255, 	g = 255, 	b = 0},
		{label = GetLocale('gold'), 		r = 255, 	g = 215, 	b = 0},
		{label = GetLocale('orange'), 	r = 255, 	g = 165, 	b = 0},
		{label = GetLocale('wheat'), 		r = 245, 	g = 222, 	b = 179},
		{label = GetLocale('red'), 		r = 255, 	g = 0, 		b = 0},
		{label = GetLocale('pink'), 		r = 255, 	g = 161, 	b = 211},
		{label = GetLocale('brightpink'),	r = 255, 	g = 0, 		b = 255},
		{label = GetLocale('purple'), 	r = 153, 	g = 0, 		b = 153},
		{label = "Ivory", 			r = 41, 	g = 36, 	b = 33}
	}

	return neons
end

function GetPlatesName(index)
	if (index == 0) then
		return GetLocale('blue_on_white_1')
	elseif (index == 1) then
		return GetLocale('yellow_on_black')
	elseif (index == 2) then
		return GetLocale('yellow_blue')
	elseif (index == 3) then
		return GetLocale('blue_on_white_2')
	elseif (index == 4) then
		return GetLocale('blue_on_white_3')
	end
end

varmechanic.Menus = {
	main = {
		label		= 'Menu Modifica',
		parent		= nil,
		upgrades	= GetLocale('upgrades'),
		cosmetics	= GetLocale('cosmetics')
	},
	upgrades = {
		-- icon = "fas fa-wrench",
		label			= GetLocale('upgrades'),
		parent			= 'main',
		modEngine		= GetLocale('engine'),
		modBrakes		= GetLocale('brakes'),
		modTransmission	= GetLocale('transmission'),
		modSuspension	= GetLocale('suspension'),
		modTurbo		= GetLocale('turbo')
	},
	modEngine = {
		icon = "fas fa-car",
		label = GetLocale('engine'),
		parent = 'upgrades',
		modType = 11,
		price = {1.0, 2.0, 3.0, 5.0}
	},
	modBrakes = {
		icon = "fas fa-car",
		label = GetLocale('brakes'),
		parent = 'upgrades',
		modType = 12,
		price = {1.0, 2.0, 3.0, 4.0}
	},
	modTransmission = {
		icon = "fas fa-car",
		label = GetLocale('transmission'),
		parent = 'upgrades',
		modType = 13,
		price = {1.0, 2.0, 3.0, 4.0}
	},
	modSuspension = {
		icon = "fas fa-car",
		label = GetLocale('suspension'),
		parent = 'upgrades',
		modType = 15,
		price = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0}
	},
	modTurbo = {
		icon = "fa-solid fa-gauge",
		label = GetLocale('turbo'),
		parent = 'upgrades',
		modType = 17,
		price = {3.0}
	},
	cosmetics = {
		icon = "fas fa-palette",
		label				= GetLocale('cosmetics'),
		parent				= 'main',
		bodyparts			= GetLocale('bodyparts'),
		windowTint			= GetLocale('windowtint'),
		modHorns			= GetLocale('horns'),
		neonColor			= GetLocale('neons'),
		extras				= "Extra",
		resprays			= GetLocale('respray'),
		modXenon			= GetLocale('headlights'),
		plateIndex			= GetLocale('licenseplates'),
		wheels				= GetLocale('wheels'),
		modPlateHolder		= GetLocale('modplateholder'),
		modVanityPlate		= GetLocale('modvanityplate'),
		modTrimA			= GetLocale('interior'),
		modOrnaments		= GetLocale('trim'),
		modDashboard		= GetLocale('dashboard'),
		modDial				= GetLocale('speedometer'),
		modDoorSpeaker		= GetLocale('door_speakers'),
		modSeats			= GetLocale('seats'),
		modSteeringWheel	= GetLocale('steering_wheel'),
		modShifterLeavers	= GetLocale('gear_lever'),
		modAPlate			= GetLocale('quarter_deck'),
		modSpeakers			= GetLocale('speakers'),
		modTrunk			= GetLocale('trunk'),
		modHydrolic			= GetLocale('hydraulic'),
		modEngineBlock		= GetLocale('engine_block'),
		modAirFilter		= GetLocale('air_filter'),
		modStruts			= GetLocale('struts'),
		modArchCover		= GetLocale('arch_cover'),
		modAerials			= GetLocale('aerials'),
		modTrimB			= GetLocale('wings'),
		modTank				= GetLocale('fuel_tank'),
		modWindows			= GetLocale('windows'),
		modLivery			= GetLocale('stickers'),
		livrea			= "Livree"
	},

	modPlateHolder = {
		icon = "fas fa-tag",
		label = GetLocale('modplateholder'),
		parent = 'cosmetics',
		modType = 25,
		price = 1.0
	},
	modVanityPlate = {
		icon = "fas fa-tag",
		label = GetLocale('modvanityplate'),
		parent = 'cosmetics',
		modType = 26,
		price = 1.0
	},
	modTrimA = {
		label = GetLocale('interior'),
		parent = 'cosmetics',
		modType = 27,
		price = 1.0
	},
	modOrnaments = {
		label = GetLocale('trim'),
		parent = 'cosmetics',
		modType = 28,
		price = 1.0
	},
	modDashboard = {
		label = GetLocale('dashboard'),
		parent = 'cosmetics',
		modType = 29,
		price = 1.0
	},
	modDial = {
		label = GetLocale('speedometer'),
		parent = 'cosmetics',
		modType = 30,
		price = 1.0
	},
	modDoorSpeaker = {
		icon = "fas fa-volume-up",
		label = GetLocale('door_speakers'),
		parent = 'cosmetics',
		modType = 31,
		price = 1.0
	},
	modSeats = {
		label = GetLocale('seats'),
		parent = 'cosmetics',
		modType = 32,
		price = 1.0
	},
	modSteeringWheel = {
		label = GetLocale('steering_wheel'),
		parent = 'cosmetics',
		modType = 33,
		price = 1.0
	},
	modShifterLeavers = {
		label = GetLocale('gear_lever'),
		parent = 'cosmetics',
		modType = 34,
		price = 1.0
	},
	modAPlate = {
		label = GetLocale('quarter_deck'),
		parent = 'cosmetics',
		modType = 35,
		price = 1.0
	},
	modSpeakers = {
		label = GetLocale('speakers'),
		parent = 'cosmetics',
		modType = 36,
		price = 1.0
	},
	modTrunk = {
		label = GetLocale('trunk'),
		parent = 'cosmetics',
		modType = 37,
		price = 1.0
	},
	modHydrolic = {
		label = GetLocale('hydraulic'),
		parent = 'cosmetics',
		modType = 38,
		price = 1.0
	},
	modEngineBlock = {
		label = GetLocale('engine_block'),
		parent = 'cosmetics',
		modType = 39,
		price = 1.0
	},
	modAirFilter = {
		label = GetLocale('air_filter'),
		parent = 'cosmetics',
		modType = 40,
		price = 1.0
	},
	modStruts = {
		label = GetLocale('struts'),
		parent = 'cosmetics',
		modType = 41,
		price = 1.0
	},
	modArchCover = {
		label = GetLocale('arch_cover'),
		parent = 'cosmetics',
		modType = 42,
		price = 1.0
	},
	modAerials = {
		label = GetLocale('aerials'),
		parent = 'cosmetics',
		modType = 43,
		price = 1.0
	},
	modTrimB = {
		label = GetLocale('wings'),
		parent = 'cosmetics',
		modType = 44,
		price = 1.0
	},
	modTank = {
		label = GetLocale('fuel_tank'),
		parent = 'cosmetics',
		modType = 45,
		price = 1.0
	},
	modWindows = {
		label = GetLocale('windows'),
		parent = 'cosmetics',
		modType = 46,
		price = 1.0
	},
	modLivery = {
		icon = "fas fa-paint-roller",
		label = GetLocale('stickers'),
		parent = 'cosmetics',
		modType = 48,
		price = 1.0
	},

	wheels = {
		label = GetLocale('wheels'),
		parent = 'cosmetics',
		modFrontWheelsTypes = GetLocale('wheel_type'),
		modFrontWheelsColor = GetLocale('wheel_color'),
		tyreSmokeColor = GetLocale('tiresmoke')
	},
	modFrontWheelsTypes = {
		label				= GetLocale('wheel_type'),
		parent				= 'wheels',
		modFrontWheelsType0	= GetLocale('sport'),
		modFrontWheelsType1	= GetLocale('muscle'),
		modFrontWheelsType2	= GetLocale('lowrider'),
		modFrontWheelsType3	= GetLocale('suv'),
		modFrontWheelsType4	= GetLocale('allterrain'),
		modFrontWheelsType5	= GetLocale('tuning'),
		modFrontWheelsType6	= GetLocale('motorcycle'),
		modFrontWheelsType7	= GetLocale('highend')
	},
	modFrontWheelsType0 = {
		label = GetLocale('sport'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 0,
		price = 1.0
	},
	modFrontWheelsType1 = {
		label = GetLocale('muscle'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 1,
		price = 1.0
	},
	modFrontWheelsType2 = {
		label = GetLocale('lowrider'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 2,
		price = 1.0
	},
	modFrontWheelsType3 = {
		label = GetLocale('suv'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 3,
		price = 1.0
	},
	modFrontWheelsType4 = {
		label = GetLocale('allterrain'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 4,
		price = 1.0
	},
	modFrontWheelsType5 = {
		label = GetLocale('tuning'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 5,
		price = 1.0
	},
	modFrontWheelsType6 = {
		label = GetLocale('motorcycle'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 6,
		price = 1.0
	},
	modFrontWheelsType7 = {
		label = GetLocale('highend'),
		parent = 'modFrontWheelsTypes',
		modType = 23,
		wheelType = 7,
		price = 1.0
	},
	modFrontWheelsColor = {
		label = GetLocale('wheel_color'),
		parent = 'wheels'
	},
	wheelColor = {
		label = GetLocale('wheel_color'),
		parent = 'modFrontWheelsColor',
		modType = 'wheelColor',
		price = 1.0
	},
	plateIndex = {
		label = GetLocale('licenseplates'),
		parent = 'cosmetics',
		modType = 'plateIndex',
		price = 1.0
	},
	resprays = {
		icon = "fas fa-palette",
		label = GetLocale('respray'),
		parent = 'cosmetics',
		primaryRespray = GetLocale('primary'),
		dashboardRespray = "Colore Dashboard",
		interiorRespray = "Colore Interno",
		secondaryRespray = GetLocale('secondary'),
		pearlescentRespray = GetLocale('pearlescent'),
	},
	primaryRespray = {
		icon = "fas fa-palette",
		label = GetLocale('primary'),
		parent = 'resprays',
	},
	secondaryRespray = {
		icon = "fas fa-palette",
		label = GetLocale('secondary'),
		parent = 'resprays',
	},
	interiorRespray = {
		icon = "fas fa-palette",
		label = "Colore Interno",
		parent = 'resprays',
	},
	dashboardRespray = {
		icon = "fas fa-palette",
		label = "Colore Dashboard",
		parent = 'resprays',
	},
	pearlescentRespray = {
		icon = "fas fa-palette",
		label = GetLocale('pearlescent'),
		parent = 'resprays',
	},
	color1 = {
		icon = "fas fa-palette",
		label = GetLocale('primary'),
		parent = 'primaryRespray',
		modType = 'color1',
		price = 2.0
	},
	color2 = {
		icon = "fas fa-palette",
		label = GetLocale('secondary'),
		parent = 'secondaryRespray',
		modType = 'color2',
		price = 2.0
	},
	dashboardcolor = {
		icon = "fas fa-palette",
		label = "Colore Dashboard",
		parent = 'dashboardRespray',
		modType = 'dashboardcolor',
		price = 2.0
	},
	interiorcolor = {
		icon = "fas fa-palette",
		label = "Colore Interno",
		parent = 'interiorRespray',
		modType = 'interiorcolor',
		price = 2.0
	},
	pearlescentColor = {
		label = GetLocale('pearlescent'),
		parent = 'pearlescentRespray',
		modType = 'pearlescentColor',
		price = 1.0
	},
	modXenon = {
		icon = "fas fa-lightbulb",
		label = GetLocale('headlights'),
		parent = 'cosmetics',
		modType = 22,
		price = 1.0
	},
	bodyparts = {
		label = GetLocale('bodyparts'),
		parent = 'cosmetics',
		modFender = GetLocale('leftfender'),
		modRightFender = GetLocale('rightfender'),
		modSpoilers = GetLocale('spoilers'),
		modSideSkirt = GetLocale('sideskirt'),
		modFrame = GetLocale('cage'),
		modHood = GetLocale('hood'),
		modGrille = GetLocale('grille'),
		modRearBumper = GetLocale('rearbumper'),
		modFrontBumper = GetLocale('frontbumper'),
		modExhaust = GetLocale('exhaust'),
		modRoof = GetLocale('roof')
	},
	modSpoilers = {
		label = GetLocale('spoilers'),
		parent = 'bodyparts',
		modType = 0,
		price = 1.0
	},
	modFrontBumper = {
		label = GetLocale('frontbumper'),
		parent = 'bodyparts',
		modType = 1,
		price = 1.0
	},
	modRearBumper = {
		label = GetLocale('rearbumper'),
		parent = 'bodyparts',
		modType = 2,
		price = 1.0
	},
	modSideSkirt = {
		label = GetLocale('sideskirt'),
		parent = 'bodyparts',
		modType = 3,
		price = 1.0
	},
	modExhaust = {
		label = GetLocale('exhaust'),
		parent = 'bodyparts',
		modType = 4,
		price = 1.0
	},
	modFrame = {
		label = GetLocale('cage'),
		parent = 'bodyparts',
		modType = 5,
		price = 1.0
	},
	modGrille = {
		label = GetLocale('grille'),
		parent = 'bodyparts',
		modType = 6,
		price = 1.0
	},
	modHood = {
		label = GetLocale('hood'),
		parent = 'bodyparts',
		modType = 7,
		price = 1.0
	},
	modFender = {
		label = GetLocale('leftfender'),
		parent = 'bodyparts',
		modType = 8,
		price = 1.0
	},
	modRightFender = {
		label = GetLocale('rightfender'),
		parent = 'bodyparts',
		modType = 9,
		price = 1.0
	},
	modRoof = {
		label = GetLocale('roof'),
		parent = 'bodyparts',
		modType = 10,
		price = 1.0
	},
	windowTint = {
		label = GetLocale('windowtint'),
		parent = 'cosmetics',
		modType = 'windowTint',
		price = 1.0
	},
	modHorns = {
		label = GetLocale('horns'),
		parent = 'cosmetics',
		modType = 14,
		price = 1.0
	},
	neonColor = {
		label = GetLocale('neons'),
		parent = 'cosmetics',
		modType = 'neonColor',
		price = 1.0
	},
	extras = {
		label = "Extra",
		parent = 'cosmetics',
		modType = 'extras',
		price = 1.0
	},
	tyreSmokeColor = {
		label = GetLocale('tiresmoke'),
		parent = 'wheels',
		modType = 'tyreSmokeColor',
		price = 1.0
	},
	livrea = {
		label = "Livree",
		parent = 'wheels',
		modType = 'modLivery',
		price = 1.0
	}

}


function GetVehicleProperties(vehicle)
    if not DoesEntityExist(vehicle) then
        return
    end

    local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
    local hasCustomPrimaryColor = GetIsVehiclePrimaryColourCustom(vehicle)
    local dashboardColor = GetVehicleDashboardColor(vehicle)
    local interiorColor = GetVehicleInteriorColour(vehicle)
    local customPrimaryColor = nil
    if hasCustomPrimaryColor then
        customPrimaryColor = { GetVehicleCustomPrimaryColour(vehicle) }
    end

    local hasCustomXenonColor, customXenonColorR, customXenonColorG, customXenonColorB = GetVehicleXenonLightsCustomColor(vehicle)
    local customXenonColor = nil
    if hasCustomXenonColor then
        customXenonColor = { customXenonColorR, customXenonColorG, customXenonColorB }
    end

    local hasCustomSecondaryColor = GetIsVehicleSecondaryColourCustom(vehicle)
    local customSecondaryColor = nil
    if hasCustomSecondaryColor then
        customSecondaryColor = { GetVehicleCustomSecondaryColour(vehicle) }
    end

    local extras = {}
    for extraId = 0, 20 do
        if DoesExtraExist(vehicle, extraId) then
            extras[tostring(extraId)] = IsVehicleExtraTurnedOn(vehicle, extraId)
        end
    end

    local doorsBroken, windowsBroken, tyreBurst = {}, {}, {}
    local numWheels = tostring(GetVehicleNumberOfWheels(vehicle))

    local TyresIndex = { -- Wheel index list according to the number of vehicle wheels.
        ["2"] = { 0, 4 }, -- Bike and cycle.
        ["3"] = { 0, 1, 4, 5 }, -- Vehicle with 3 wheels (get for wheels because some 3 wheels vehicles have 2 wheels on front and one rear or the reverse).
        ["4"] = { 0, 1, 4, 5 }, -- Vehicle with 4 wheels.
        ["6"] = { 0, 1, 2, 3, 4, 5 }, -- Vehicle with 6 wheels.
    }

    if TyresIndex[numWheels] then
        for _, idx in pairs(TyresIndex[numWheels]) do
            tyreBurst[tostring(idx)] = IsVehicleTyreBurst(vehicle, idx, false)
        end
    end

    for windowId = 0, 7 do -- 13
        RollUpWindow(vehicle, windowId) --fix when you put the car away with the window down
        windowsBroken[tostring(windowId)] = not IsVehicleWindowIntact(vehicle, windowId)
    end

    local numDoors = GetNumberOfVehicleDoors(vehicle)
    if numDoors and numDoors > 0 then
        for doorsId = 0, numDoors do
            doorsBroken[tostring(doorsId)] = IsVehicleDoorDamaged(vehicle, doorsId)
        end
    end

    return {
        model = GetEntityModel(vehicle),
        doorsBroken = doorsBroken,
        windowsBroken = windowsBroken,
        tyreBurst = tyreBurst,
        tyresCanBurst = GetVehicleTyresCanBurst(vehicle),
        plate = Math.Trim(GetVehicleNumberPlateText(vehicle)),
        plateIndex = GetVehicleNumberPlateTextIndex(vehicle),

        bodyHealth = Math.Round(GetVehicleBodyHealth(vehicle), 1),
        engineHealth = Math.Round(GetVehicleEngineHealth(vehicle), 1),
        tankHealth = Math.Round(GetVehiclePetrolTankHealth(vehicle), 1),

        fuelLevel = Math.Round(GetVehicleFuelLevel(vehicle), 1),
        dirtLevel = Math.Round(GetVehicleDirtLevel(vehicle), 1),
        color1 = colorPrimary,
        color2 = colorSecondary,
        customPrimaryColor = customPrimaryColor,
        customSecondaryColor = customSecondaryColor,

        pearlescentColor = pearlescentColor,
        wheelColor = wheelColor,

        dashboardColor = dashboardColor,
        interiorColor = interiorColor,

        wheels = GetVehicleWheelType(vehicle),
        windowTint = GetVehicleWindowTint(vehicle),
        xenonColor = GetVehicleXenonLightsColor(vehicle),
        customXenonColor = customXenonColor,

        neonEnabled = { IsVehicleNeonLightEnabled(vehicle, 0), IsVehicleNeonLightEnabled(vehicle, 1), IsVehicleNeonLightEnabled(vehicle, 2), IsVehicleNeonLightEnabled(vehicle, 3) },

        neonColor = table.pack(GetVehicleNeonLightsColour(vehicle)),
        extras = extras,
        tyreSmokeColor = table.pack(GetVehicleTyreSmokeColor(vehicle)),

        modSpoilers = GetVehicleMod(vehicle, 0),
        modFrontBumper = GetVehicleMod(vehicle, 1),
        modRearBumper = GetVehicleMod(vehicle, 2),
        modSideSkirt = GetVehicleMod(vehicle, 3),
        modExhaust = GetVehicleMod(vehicle, 4),
        modFrame = GetVehicleMod(vehicle, 5),
        modGrille = GetVehicleMod(vehicle, 6),
        modHood = GetVehicleMod(vehicle, 7),
        modFender = GetVehicleMod(vehicle, 8),
        modRightFender = GetVehicleMod(vehicle, 9),
        modRoof = GetVehicleMod(vehicle, 10),
        modRoofLivery = GetVehicleRoofLivery(vehicle),

        modEngine = GetVehicleMod(vehicle, 11),
        modBrakes = GetVehicleMod(vehicle, 12),
        modTransmission = GetVehicleMod(vehicle, 13),
        modHorns = GetVehicleMod(vehicle, 14),
        modSuspension = GetVehicleMod(vehicle, 15),
        modArmor = GetVehicleMod(vehicle, 16),

        modTurbo = IsToggleModOn(vehicle, 18),
        modSmokeEnabled = IsToggleModOn(vehicle, 20),
        modXenon = IsToggleModOn(vehicle, 22),

        modFrontWheels = GetVehicleMod(vehicle, 23),
        modCustomFrontWheels = GetVehicleModVariation(vehicle, 23),
        modBackWheels = GetVehicleMod(vehicle, 24),
        modCustomBackWheels = GetVehicleModVariation(vehicle, 24),

        modPlateHolder = GetVehicleMod(vehicle, 25),
        modVanityPlate = GetVehicleMod(vehicle, 26),
        modTrimA = GetVehicleMod(vehicle, 27),
        modOrnaments = GetVehicleMod(vehicle, 28),
        modDashboard = GetVehicleMod(vehicle, 29),
        modDial = GetVehicleMod(vehicle, 30),
        modDoorSpeaker = GetVehicleMod(vehicle, 31),
        modSeats = GetVehicleMod(vehicle, 32),
        modSteeringWheel = GetVehicleMod(vehicle, 33),
        modShifterLeavers = GetVehicleMod(vehicle, 34),
        modAPlate = GetVehicleMod(vehicle, 35),
        modSpeakers = GetVehicleMod(vehicle, 36),
        modTrunk = GetVehicleMod(vehicle, 37),
        modHydrolic = GetVehicleMod(vehicle, 38),
        modEngineBlock = GetVehicleMod(vehicle, 39),
        modAirFilter = GetVehicleMod(vehicle, 40),
        modStruts = GetVehicleMod(vehicle, 41),
        modArchCover = GetVehicleMod(vehicle, 42),
        modAerials = GetVehicleMod(vehicle, 43),
        modTrimB = GetVehicleMod(vehicle, 44),
        modTank = GetVehicleMod(vehicle, 45),
        modWindows = GetVehicleMod(vehicle, 46),
        modLivery = GetVehicleMod(vehicle, 48) == -1 and GetVehicleLivery(vehicle) or GetVehicleMod(vehicle, 48),
        modLightbar = GetVehicleMod(vehicle, 49),
    }
end

function SetVehicleProperties(vehicle, props)
    if not DoesEntityExist(vehicle) then
        return
    end
    local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
    SetVehicleModKit(vehicle, 0)

    if props.tyresCanBurst ~= nil then
        SetVehicleTyresCanBurst(vehicle, props.tyresCanBurst)
    end

    if props.plate ~= nil then
        SetVehicleNumberPlateText(vehicle, props.plate)
    end
    if props.plateIndex ~= nil then
        SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex)
    end
    if props.bodyHealth ~= nil then
        SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0)
    end
    if props.engineHealth ~= nil then
        SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0)
    end
    if props.tankHealth ~= nil then
        SetVehiclePetrolTankHealth(vehicle, props.tankHealth + 0.0)
    end
    if props.fuelLevel ~= nil then
        SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0)
    end
    if props.dirtLevel ~= nil then
        SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0)
    end
    if props.customPrimaryColor ~= nil then
        SetVehicleCustomPrimaryColour(vehicle, props.customPrimaryColor[1], props.customPrimaryColor[2], props.customPrimaryColor[3])
    end
    if props.customSecondaryColor ~= nil then
        SetVehicleCustomSecondaryColour(vehicle, props.customSecondaryColor[1], props.customSecondaryColor[2], props.customSecondaryColor[3])
    end
    if props.color1 ~= nil then
        SetVehicleColours(vehicle, props.color1, colorSecondary)
    end
    if props.color2 ~= nil then
        SetVehicleColours(vehicle, props.color1 or colorPrimary, props.color2)
    end
    if props.pearlescentColor ~= nil then
        SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor)
    end

    if props.interiorColor ~= nil then
        SetVehicleInteriorColor(vehicle, props.interiorColor)
    end

    if props.dashboardColor ~= nil then
        SetVehicleDashboardColor(vehicle, props.dashboardColor)
    end

    if props.wheelColor ~= nil then
        SetVehicleExtraColours(vehicle, props.pearlescentColor or pearlescentColor, props.wheelColor)
    end
    if props.wheels ~= nil then
        SetVehicleWheelType(vehicle, props.wheels)
    end
    if props.windowTint ~= nil then
        SetVehicleWindowTint(vehicle, props.windowTint)
    end

    if props.neonEnabled ~= nil then
        SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1])
        SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2])
        SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3])
        SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4])
    end

    if props.extras ~= nil then
        for extraId, enabled in pairs(props.extras) do
            SetVehicleExtra(vehicle, tonumber(extraId), enabled and 0 or 1)
        end
    end

    if props.neonColor ~= nil then
        SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3])
    end
    if props.xenonColor ~= nil then
        SetVehicleXenonLightsColor(vehicle, props.xenonColor)
    end
    if props.customXenonColor ~= nil then
        SetVehicleXenonLightsCustomColor(vehicle, props.customXenonColor[1], props.customXenonColor[2], props.customXenonColor[3])
    end
    if props.modSmokeEnabled ~= nil then
        ToggleVehicleMod(vehicle, 20, true)
    end
    if props.tyreSmokeColor ~= nil then
        SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3])
    end
    if props.modSpoilers ~= nil then
        SetVehicleMod(vehicle, 0, props.modSpoilers, false)
    end
    if props.modFrontBumper ~= nil then
        SetVehicleMod(vehicle, 1, props.modFrontBumper, false)
    end
    if props.modRearBumper ~= nil then
        SetVehicleMod(vehicle, 2, props.modRearBumper, false)
    end
    if props.modSideSkirt ~= nil then
        SetVehicleMod(vehicle, 3, props.modSideSkirt, false)
    end
    if props.modExhaust ~= nil then
        SetVehicleMod(vehicle, 4, props.modExhaust, false)
    end
    if props.modFrame ~= nil then
        SetVehicleMod(vehicle, 5, props.modFrame, false)
    end
    if props.modGrille ~= nil then
        SetVehicleMod(vehicle, 6, props.modGrille, false)
    end
    if props.modHood ~= nil then
        SetVehicleMod(vehicle, 7, props.modHood, false)
    end
    if props.modFender ~= nil then
        SetVehicleMod(vehicle, 8, props.modFender, false)
    end
    if props.modRightFender ~= nil then
        SetVehicleMod(vehicle, 9, props.modRightFender, false)
    end
    if props.modRoof ~= nil then
        SetVehicleMod(vehicle, 10, props.modRoof, false)
    end

    if props.modRoofLivery ~= nil then
        SetVehicleRoofLivery(vehicle, props.modRoofLivery)
    end

    if props.modEngine ~= nil then
        SetVehicleMod(vehicle, 11, props.modEngine, false)
    end
    if props.modBrakes ~= nil then
        SetVehicleMod(vehicle, 12, props.modBrakes, false)
    end
    if props.modTransmission ~= nil then
        SetVehicleMod(vehicle, 13, props.modTransmission, false)
    end
    if props.modHorns ~= nil then
        SetVehicleMod(vehicle, 14, props.modHorns, false)
    end
    if props.modSuspension ~= nil then
        SetVehicleMod(vehicle, 15, props.modSuspension, false)
    end
    if props.modArmor ~= nil then
        SetVehicleMod(vehicle, 16, props.modArmor, false)
    end
    if props.modTurbo ~= nil then
        ToggleVehicleMod(vehicle, 18, props.modTurbo)
    end
    if props.modXenon ~= nil then
        ToggleVehicleMod(vehicle, 22, props.modXenon)
    end
    if props.modFrontWheels ~= nil then
        SetVehicleMod(vehicle, 23, props.modFrontWheels, props.modCustomFrontWheels)
    end
    if props.modBackWheels ~= nil then
        SetVehicleMod(vehicle, 24, props.modBackWheels, props.modCustomBackWheels)
    end
    if props.modPlateHolder ~= nil then
        SetVehicleMod(vehicle, 25, props.modPlateHolder, false)
    end
    if props.modVanityPlate ~= nil then
        SetVehicleMod(vehicle, 26, props.modVanityPlate, false)
    end
    if props.modTrimA ~= nil then
        SetVehicleMod(vehicle, 27, props.modTrimA, false)
    end
    if props.modOrnaments ~= nil then
        SetVehicleMod(vehicle, 28, props.modOrnaments, false)
    end
    if props.modDashboard ~= nil then
        SetVehicleMod(vehicle, 29, props.modDashboard, false)
    end
    if props.modDial ~= nil then
        SetVehicleMod(vehicle, 30, props.modDial, false)
    end
    if props.modDoorSpeaker ~= nil then
        SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false)
    end
    if props.modSeats ~= nil then
        SetVehicleMod(vehicle, 32, props.modSeats, false)
    end
    if props.modSteeringWheel ~= nil then
        SetVehicleMod(vehicle, 33, props.modSteeringWheel, false)
    end
    if props.modShifterLeavers ~= nil then
        SetVehicleMod(vehicle, 34, props.modShifterLeavers, false)
    end
    if props.modAPlate ~= nil then
        SetVehicleMod(vehicle, 35, props.modAPlate, false)
    end
    if props.modSpeakers ~= nil then
        SetVehicleMod(vehicle, 36, props.modSpeakers, false)
    end
    if props.modTrunk ~= nil then
        SetVehicleMod(vehicle, 37, props.modTrunk, false)
    end
    if props.modHydrolic ~= nil then
        SetVehicleMod(vehicle, 38, props.modHydrolic, false)
    end
    if props.modEngineBlock ~= nil then
        SetVehicleMod(vehicle, 39, props.modEngineBlock, false)
    end
    if props.modAirFilter ~= nil then
        SetVehicleMod(vehicle, 40, props.modAirFilter, false)
    end
    if props.modStruts ~= nil then
        SetVehicleMod(vehicle, 41, props.modStruts, false)
    end
    if props.modArchCover ~= nil then
        SetVehicleMod(vehicle, 42, props.modArchCover, false)
    end
    if props.modAerials ~= nil then
        SetVehicleMod(vehicle, 43, props.modAerials, false)
    end
    if props.modTrimB ~= nil then
        SetVehicleMod(vehicle, 44, props.modTrimB, false)
    end
    if props.modTank ~= nil then
        SetVehicleMod(vehicle, 45, props.modTank, false)
    end
    if props.modWindows ~= nil then
        SetVehicleMod(vehicle, 46, props.modWindows, false)
    end

    if props.modLivery ~= nil then
        SetVehicleMod(vehicle, 48, props.modLivery, false)
        SetVehicleLivery(vehicle, props.modLivery)
    end

    if props.windowsBroken ~= nil then
        for k, v in pairs(props.windowsBroken) do
            if v then
                RemoveVehicleWindow(vehicle, tonumber(k))
            end
        end
    end

    if props.doorsBroken ~= nil then
        for k, v in pairs(props.doorsBroken) do
            if v then
                SetVehicleDoorBroken(vehicle, tonumber(k), true)
            end
        end
    end

    if props.tyreBurst ~= nil then
        for k, v in pairs(props.tyreBurst) do
            if v then
                SetVehicleTyreBurst(vehicle, tonumber(k), true, 1000.0)
            end
        end
    end
end


Math = {}
function Math.Trim(value)
    if value then
        return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
    else
        return nil
    end
end

function Math.Round(value, numDecimalPlaces)
    if numDecimalPlaces then
        local power = 10 ^ numDecimalPlaces
        return math.floor((value * power) + 0.5) / power
    else
        return math.floor(value + 0.5)
    end
end
