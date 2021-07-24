
print("/////////////////////////////////")
print("//    Smooth Scroll StartUp    //")
print("/////////////////////////////////")
print("By Minbird")
print("System Version: 1.0")
print("System Version Date: 2021.7.25")
print("[Smooth Scroll] Starting...")

print("[Smooth Scroll] Adding Client side files...")
AddCSLuaFile("smooth_scroll/smooth_scroll.lua")
if CLIENT then
	include("smooth_scroll/smooth_scroll.lua")
end
print("[Smooth Scroll] smooth_scroll/smooth_scroll.lua...")

print("[Smooth Scroll] Startup complete!")