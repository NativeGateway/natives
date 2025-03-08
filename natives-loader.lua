loadstring([[
	function LPH_NO_VIRTUALIZE(f) return f end;

	function LPH_JIT(f) return f end;

	function LPH_JIT_MAX(f) return f end;
]])();

local InterfaceEnabled = false

if not script_key
or #script_key < 16
or type(script_key) ~= "string" then
	InterfaceEnabled = true
elseif script_key 
and #script_key >= 16
and type(script_key) == "string" then
	script_key = script_key:gsub("%W", "")
end

-- Library
local Library = (getgenv and getgenv().NATIVELIBRARY) or loadstring(game:HttpGet("https://getnative.cc/script/interface" or "https://pastebin.com/raw/7UZTruD4" or "https://raw.githubusercontent.com/Native-lab/Native/refs/heads/main/Library/UI.lua", true))()

getgenv().NATIVELIBRARY = Library

local RunLoader = (function(write)
	local Projects = {
		["Death Ball"] = {
			GameId = 5166944221;
			PlaceIds = {};
			Loader = "https://api.luarmor.net/files/v3/loaders/c1e22c6997f84329ce2f8667f71828f8.lua";
		};
		["Anime Vanguards"] = {
			GameId = 5578556129;
			PlaceIds = {};
			Loader = "https://api.luarmor.net/files/v3/loaders/c296c70e07b1a42087ce52d1d2625af6.lua";
		};
		["Fisch"] = {
			GameId = 5750914919;
			PlaceIds = {};
			Loader = "https://api.luarmor.net/files/v3/loaders/4fc6ba8a6aa72adc07287f84ece4730d.lua";
		};
		["Fisch: Test"] = {
			GameId = 6756890519;
			PlaceIds = {};
			Loader = "https://api.luarmor.net/files/v3/loaders/4fc6ba8a6aa72adc07287f84ece4730d.lua";
		};
		["Fisch: Test 2"] = {
			GameId = 5750914919;
			PlaceIds = {};
			Loader = "https://api.luarmor.net/files/v3/loaders/4fc6ba8a6aa72adc07287f84ece4730d.lua";
		};
		["Jujutsu Infinite"] = {
			GameId = 3808223175;
			PlaceIds = {};
			Loader = "https://api.luarmor.net/files/v3/loaders/1e9916162a8c65e9b12fb4fd43fdb2ab.lua";
		};
		["Anime Adventures"] = {
			GameId = 3183403065;
			PlaceIds = {};
			Loader = "https://api.luarmor.net/files/v3/loaders/e35860641326143c12c12f00dbffade4.lua";
		};
	};
	
	local Loaded = false
	
	for i, v in pairs(Projects) do
		local Loader = v.Loader

		if v.GameId == game.GameId then
			Loaded = true
	
			print("script_key =", script_key)

			print(("Loading %s"):format(i))
	
			if not write then
				local GETResponse = game.HttpGet(game, Loader)

				if GETResponse then
					(
						loadstring or load
					)(
						GETResponse
					)()
				else
					warn(("Could not fetch %s; Suggest switching to an executor that isn't any of the following: Solara and Xeno"):format(Loader or "loader"))
				end
			else
				local InterfaceEnabled = false

				if not script_key
				or #script_key < 16 then
					InterfaceEnabled = true
				end

				setclipboard(
					('-- Native: %s;\nscript_key = "%s";\n(loadstring or load)(game:HttpGet("%s"))();'):format(i, not InterfaceEnabled and script_key or "", v.Loader)
				)
			end
			
			print(("Loaded %s"):format(i))
	
			break
		end
	end
	
	if not Loaded then
		warn(("Unrecognized GameId %d"):format(game.GameId))
	
		setclipboard(tostring(game.GameId))
	end
end)

local service = setmetatable({}, {
	__index = function(self, key)
		return (cloneref or function(service) return service end)(game.GetService(game, key))
	end
})

local HttpService = service.HttpService

local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

local Init = Library:Init({
	Name = "Native";
	Parent = service.CoreGui;
	Callback = function(self)

	end;
})

do
	local Window = Init:CreateWindow({
		Name = "Loader";
		Visible = true;
		Silent = false;
		Asset = false;
		Keybind = Enum.KeyCode.RightShift;
		Callback = function(self)

		end;
	}); do
		local Loader = Window:CreateTab({
			Name = "Loader";
			Home = true;
			Icon = nil;
			LayoutOrder = 1;
			Callback = function(self)

			end;
		}); do
			local Load = Loader:CreateSection({
				Name = "Load";
				Visible = true;
				LayoutOrder = 1;
				Callback = function(self)

				end;
			}); do
				local Button = Load:CreateButton({
					Name = "Join Our Discord Server";
					Initial = false;
					LayoutOrder = 1;
					Callback = function(self)
						setclipboard("https://discord.gg/natives")

						Init:Notify({
							Name = ("Copied Discord Url");
							Body = ("");
							Duration = 2.5;
							Callback = function(self)
			
							end;
						})

						if httprequest then
							task.spawn(function()
								pcall(function()
									httprequest({
										Url = 'http://127.0.0.1:6463/rpc?v=1',
										Method = 'POST',
										Headers = {
											['Content-Type'] = 'application/json',
											Origin = 'https://discord.com/'
										},
										Body = HttpService:JSONEncode({
											cmd = 'INVITE_BROWSER',
											nonce = HttpService:GenerateGUID(false),
											args = {code = 'natives'}
										})
									})
								end)
							end)
						end
					end;
				})

				if true then
					Init:CreateDialog({
						Name = ("Native");
						Body = ("You are being invited to our Discord server!");
						Duration = 15;
						Buttons = {};
						Callback = function(self)
							
						end;
					})

					if httprequest then
						task.spawn(function()
							pcall(function()
								httprequest({
									Url = 'http://127.0.0.1:6463/rpc?v=1',
									Method = 'POST',
									Headers = {
										['Content-Type'] = 'application/json',
										Origin = 'https://discord.com/'
									},
									Body = HttpService:JSONEncode({
										cmd = 'INVITE_BROWSER',
										nonce = HttpService:GenerateGUID(false),
										args = {code = 'natives'}
									})
								})
							end)
						end)
					end
				end

				local Change = Load:CreateChange({
					Name = "Changelog";
					Initial = true;
					LayoutOrder = 1;
					Logs = {
						"[+] Anime Adventures 1/14/2025";
						"[+] Jujutsu Infinite 7/25/2025";
						"[+] Fisch 11/16/2024";
						"[+] Anime Vanguards 9/14/2024";
						"[+] Death Ball 1/23/2024";
					};
					Callback = function(self)
						
					end;
				});

				local Input = Load:CreateInput({
					Name = "Key";
					Initial = false;
					Integer = false;
					LayoutOrder = 1;
					ClearTextOnFocus = false;
					Placeholder = "Key here...";
					Value = "";
					Callback = function(self, Value, Enter)
						script_key = Value:gsub("%W", "")

					end;
				})

				local Button = Load:CreateButton({
					Name = "Load";
					Initial = false;
					LayoutOrder = 1;
					Callback = function(self)
						Window:Destroy()

						RunLoader()

						Init:Notify({
							Name = ("Loaded");
							Body = ("");
							Duration = 5;
							Callback = function(self)
			
							end;
						})

						task.spawn(function()
							task.wait(2.5)

							Init:Destroy()
						end)
					end;
				})

				local Button = Load:CreateButton({
					Name = "Copy Key Url : Get Key (Linkvertise)";
					Initial = false;
					LayoutOrder = 1;
					Callback = function(self)
						setclipboard("https://ads.luarmor.net/get_key?for=Native_Main-bYkgrQsRymol")

						Init:Notify({
							Name = ("Copied Key Url");
							Body = ("");
							Duration = 2.5;
							Callback = function(self)
			
							end;
						})
					end;
				})

				local Button = Load:CreateButton({
					Name = "Copy Key Url : Get Key (Lootlabs)";
					Initial = false;
					LayoutOrder = 1;
					Callback = function(self)
						setclipboard("https://ads.luarmor.net/get_key?for=Native_Main-FvLcrZfqqbWo")

						Init:Notify({
							Name = ("Copied Key Url");
							Body = ("");
							Duration = 2.5;
							Callback = function(self)
			
							end;
						})
					end;
				})

				local Button = Load:CreateButton({
					Name = "Copy Script Loader";
					Initial = false;
					LayoutOrder = 1;
					Callback = function(self)
						RunLoader(true)

						Init:Notify({
							Name = ("Copied Script Loader");
							Body = ("");
							Duration = 2.5;
							Callback = function(self)
			
							end;
						})
					end;
				})

				local Button = Load:CreateButton({
					Name = "Destroy";
					Initial = false;
					LayoutOrder = 1;
					Callback = function(self)
						Init:Destroy()
					end;
				})
			end
		end
	end
end

if not InterfaceEnabled then
	task.spawn(function()
		RunLoader()
	end)

	Init:Destroy()
end