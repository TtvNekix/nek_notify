local VERSION = 1.0

-- VERSION AND NAME CHECKER DON'T DELETE THIS IF YOU WANT TO RECEIVE NEW UPDATES
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        function checkVersion(error, latestVersion, headers)
			local currentVersion = VERSION
            local name = "[^4nek_notify^7]"
            Citizen.Wait(2000)
            
			if tonumber(currentVersion) < tonumber(latestVersion) then
				print(name .. " ^1is outdated.\nCurrent version: ^8" .. currentVersion .. "\nNewest version: ^2" .. latestVersion .. "\n^3Update^7: https://github.com/TtvNekix/nek_notify")
			else
				print(name .. " is updated.")
			end
		end

		function checkUpdates(error2, update, headers2)
			local updates = update
			local name = "[^4nek_notify^7]"
            Citizen.Wait(3000)
            
			print(name .." Last Updates \n[\n".. tostring(updates) .."]")
		end
	
		PerformHttpRequest("https://raw.githubusercontent.com/TtvNekix/notifychecker/main/version", checkVersion, "GET")
		PerformHttpRequest("https://raw.githubusercontent.com/TtvNekix/notifychecker/main/updates", checkUpdates, "GET")
    end
end)
-----------------------------------