local Vehicles

RegisterServerEvent('fdsdev_lscustom:buyMod')
AddEventHandler('fdsdev_lscustom:buyMod', function()
	local _source = source
    local societyAccount
	TriggerClientEvent('esx:showNotification', _source, "Hai installato questa modifica!")
	TriggerClientEvent('fdsdev_lscustom:installMod', _source)
end)

RegisterCommand("openMenuLSCUSTOM", function(source)
   	TriggerClientEvent("fdsdev_mechanicmenu:open", source)	
end)
