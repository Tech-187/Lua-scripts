if not game:IsLoaded() then
	local notLoaded = Instance.new("Message")
	notLoaded.Parent = game:GetService("CoreGui")
	notLoaded.Text = 'W SCRIPT is waiting for the game to load.'
	game.Loaded:Wait()
	notLoaded:Destroy()
end

shared.gpcheck = true
local ndetectorrr = true
local antirunc = false
local userId = game.Players.LocalPlayer.UserId

--// Gamepass checker \\--

local passid = 1293677

local function runCmd(msg)
    game.Players:Chat(msg)
end

if shared.gpcheck == true then
    if string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. userId .. "/items/GamePass/" .. passid), passid) then
        print("Perm found")
        shared.nperm = false
    else
        print("Perm not found. I recommend you to atleast have one perm account for this game")
        shared.nperm = true
    end
end

local gbl = true
local BlacklistedGear = {"IvoryPeriastron","Transmorpher","LaserFingerPointers","IceStaff"} -- You can find the tool names using this script https://raw.githubusercontent.com/Tech-187/Lua-scripts/main/Inventory%20tool%20checker
local gearwhitelisted = {"t_echr","CherishClayton","KungfuPandiSenpai"} -- Players that are in this table won't get ungeared.

coroutine.wrap(function()while task.wait()do if shared.nperm then if game.Workspace.SecureParts.AdminPads:FindFirstChild(game.Players.LocalPlayer.Name.."'s admin")then task.wait(.40)else local a=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;task.wait(0.05)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(14,28,106)task.wait(1)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(10,28,107)task.wait(1)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(5,28,107)task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(2,28,107)task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-2,28,107)task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-6,28,107)task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-10,28,107)game.Players:Chat(":invisible")task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-14,28,107)task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-18,28,107)game.Players:Chat(":invisible")task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=a;game.Players:Chat(":invisible")end end end end)()

local rns = game:GetService("RunService")
local tps = game:GetService("TeleportService")
local http = game:GetService("HttpService")
local ws = game:GetService("Workspace")
local plyrs = game:GetService("Players")
local sg = game:GetService("StarterGui")
local uis = game:GetService("UserInputService")
local plr = plyrs.LocalPlayer
local Plrname = plr.Name


local GearIDs = { 100472084, 101078326, 100472063, 101078350, 101078524, 100469994, 101078559, 101078911, 101078953, 101079008, 101106419, 101106464, 101110605, 101191388, 101715440, 101734094, 101854599, 101854660, 102705386, 102705402, 102705430, 102705454, 103234296, 103234612, 103235041, 103338520, 103358098, 103359953, 104642522, 104642550, 104642566, 104642700, 10468797, 10468915, 10469910, 10472779, 10510024, 105179506, 105189286, 105189783, 105289761, 105351503, 105351545, 105351572, 105351720, 105351748, 105430216, 106064277, 106064315, 106064447, 106064469, 106701564, 106701619, 106701659, 106701702, 10727852, 10730984, 107458429, 107458461, 107458483, 107458531, 10758456, 10760425, 108148416, 108148449, 108148479, 108149175, 108149201, 108153884, 108155504, 108158379, 108158439, 108234775, 10831489, 10831509, 10884288, 108875151, 108875172, 108875216, 108875237, 108899214, 10910681, 109364052, 109583771, 109583797, 109583822, 109583846, 110204666, 110335886, 110337782, 110337828, 110337853, 110337884, 110337910, 110702207, 110703943, 110704033, 110789105, 110892267, 11115851, 111518891, 111876831, 112591865, 112591894, 112593662, 112593687, 113299556, 113299590, 113299620, 113299641, 113328094, 11373617, 11377306, 114020480, 114020505, 114020538, 114020557, 11419319, 11419882, 114491710, 11450664, 11452821, 11453385, 114552541, 114687223, 114687236, 114687251, 114690870, 115377964, 11563251, 116040770, 116040789, 116040807, 116040828, 116055112, 116693694, 116693715, 116693735, 116693764, 11719016, 117498775, 117498793, 117498849, 117544573, 118281463, 118281490, 118281529, 118281609, 118650365, 11885154, 11895536, 119101539, 119101595, 119101643, 11956382, 119917487, 119917513, 119917531, 119917556, 119934168, 11999235, 11999247, 11999279, 120307951, 120749408, 120749452, 120749494, 120749528, 121121915, 121385193, 121385230, 121385262, 121385328, 12145515, 12187319, 12187348, 12187431, 121925044, 121946387, 122278149, 122278207, 122278276, 122278316, 122330194, 123042140, 123134886, 123134949, 123234510, 123234545, 123234626, 123234673, 124126528, 124126871, 124127383, 124128001, 124472052, 124908320, 124908832, 125013769, 125013799, 125013830, 125013849, 12504077, 12547976, 12562390, 12562394, 12562495, 125859385, 125859450, 125859483, 126704033, 126710875, 126719093, 126719120, 126719148, 127506105, 127506257, 127506324, 127506364, 12775410, 128160832, 128160929, 128162639, 128162713, 128209615, 128210518, 12848902, 12890798, 12902404, 12909278, 129457095, 129471121, 129471151, 129471170, 130112971, 130113061, 130113146, 130167063, 130925426, 131372632, 131592085, 13206856, 13206887, 13206984, 13207169, 132789698, 132870835, 133315268, 134109039, 134111541, 13477890, 13477940, 13478015, 135472231, 135518721, 135949859, 135949881, 136170437, 136172718, 136213778, 13745494, 13838639, 13841367, 138761013, 139308319, 139574344, 139577901, 139577956, 139577997, 139578061, 139578136, 139578207, 139578571, 139581823, 139586244, 139593916, 140490812, 140821168, 14130887, 14131296, 14131602, 141759818, 142498104, 143517948, 143606297, 143606363, 143606407, 144510568, 14492601, 144980658, 14516975, 146026904, 146026928, 146026944, 146047188, 146047220, 146047247, 146057771, 146071355, 147143821, 147143848, 147143863, 147143881, 14719505, 147937284, 147937377, 147937415, 147937443, 147948041, 148017553, 148521629, 14864611, 14876573, 148790984, 148791372, 148791414, 148791460, 148812192, 149222485, 149222558, 149411775, 149612167, 149612200, 149612243, 149638899, 150336333, 150336402, 150363993, 150366274, 150366320, 150366351, 150927798, 150980377, 150980409, 150980444, 150980471, 151291980, 151292047, 151311761, 15176169, 15177716, 151777652, 15179006, 152173291, 152173304, 152173333, 152187131, 152187198, 152233094, 152233381, 152660131, 152660258, 152766031, 152822815, 152822847, 152823565, 152823669, 152824068, 152824174, 152832328, 152971952, 153025459, 153938986, 153939072, 153939226, 15397778, 15470183, 15470222, 15470359, 154727201, 154727251, 154727343, 154727487, 155414424, 155661985, 155662051, 155662087, 155696189, 15642486, 156467855, 156467926, 156467963, 156467990, 15668963, 157205782, 157205818, 157205831, 157205837, 15731350, 158069071, 158069110, 158069143, 158069180, 159199204, 159199218, 159199229, 159199263, 159229806, 15932306, 15970544, 15973049, 15973059, 159913543, 160189476, 160189629, 160189720, 160189871, 160198008, 160198363, 160198658, 160199141, 161075864, 161208517, 161211085, 161216321, 161219921, 161219985, 161220552, 161230469, 161282711, 16200199, 16200204, 16200373, 16200402, 16200420, 16200508, 16201421, 16201628, 16214845, 16216702, 162857268, 162857316, 162857357, 162857391, 162857422, 162979146, 162979250, 163323379, 163348575, 163348758, 163348987, 163350265, 163351579, 163351966, 163352376, 163353363, 163354553, 163355211, 163355404, 163355764, 163488515, 163995329, 163995460, 164015715, 164016477, 164017027, 164174293, 164174394, 164207580, 164207842, 16433862, 16435306, 16435368, 164369961, 16469499, 16641274, 16688968, 16722267, 16726030, 16726984, 168140516, 168140813, 168140949, 168141301, 168141496, 168142114, 168142394, 168142620, 168142869, 168143042, 16895215, 16924676, 16951083, 169602010, 169602103, 169602388, 169669671, 16969792, 16975388, 16979083, 16986649, 16986805, 16987194, 170896461, 170896571, 170896941, 170897263, 170902990, 170903216, 170903610, 170903868, 172246669, 172246820, 172248941, 172249239, 172289170, 172298750, 17237662, 17237675, 17237692, 172921991, 172922026, 172922089, 173751087, 173755801, 173781053, 173812248, 17407931, 174418144, 174752186, 174752245, 174752400, 174752553, 17527921, 17527923, 176087466, 176087505, 176087556, 176087597, 176087639, 176087640, 176219131, 17680660, 178076749, 178076831, 178076989, 178077177, 178400986, 179369406, 179369627, 179369752, 179369914, 179625551, 18010691, 18017365, 180298135, 180298414, 180298769, 180300142, 180313580, 180518956, 181196009, 181245094, 181245120, 181245141, 181245172, 181245219, 181355844, 181356054, 181469197, 181469279, 181550181, 18210455, 182273799, 182273893, 182273948, 18268645, 183346956, 183347165, 183355732, 183355817, 183355892, 183355969, 183441634, 183665171, 183665514, 183665594, 183665698, 183704866, 183797762, 183826384, 18409191, 18426536, 18446258, 18446266, 18462637, 18466105, 18474459, 184757813, 184757948, 184758255, 184758713, 184760397, 18479357, 18479966, 18481407, 18482562, 18482570, 185422055, 185422295, 185422758, 186521342, 186867645, 186867671, 186867693, 186868641, 186868758, 186958653, 186959114, 187688069, 18776718, 187840979, 188643628, 188644205, 188644771, 188853857, 188854357, 188868661, 18971349, 189756588, 189910262, 189910707, 189910805, 190094159, 190094270, 190094313, 190111117, 190880295, 19111869, 19111883, 19111894, 191261808, 191261930, 192456288, 192537346, 19328185, 193705415, 193743245, 193769809, 193771176, 193772607, 19381970, 19382057, 19395497, 19396450, 19397135, 19399456, 19643249, 19644347, 19703034, 19703041, 19703046, 19703062, 19703476, 19704064, 19704172, 20048880, 20056642, 20064349, 201756020, 201756469, 202039834, 202083069, 20373160, 204095612, 204095670, 204095724, 204485737, 20519646, 20577851, 206136361, 206136532, 20642023, 206566653, 206798405, 206799274, 20721924, 208659586, 208659734, 209290837, 209980135, 209980247, 21001552, 21064230, 211944997, 212296400, 212296936, 212500257, 212641536, 21294489, 21351465, 21392199, 21392417, 21416138, 21420014, 21439778, 21439893, 21439965, 21439991, 21440056, 21440120, 21440340, 21445765, 215354986, 215355157, 215355320, 215392741, 215448210, 21754543, 217901450, 21802000, 218631022, 218631128, 218631227, 218634097, 220288951, 220288991, 220289039, 221173389, 221173959, 221181437, 221241923, 221266538, 22152171, 22152195, 22152211, 22152234, 22158176, 223132403, 223132588, 223439643, 223785065, 223785350, 223785473, 223800426, 225921000, 225921137, 225921650, 225921724, 22596452, 226205948, 226206253, 226206426, 226206639, 22787168, 22787189, 22787248, 22788064, 22788102, 22788134, 22788972, 228588531, 228588651, 228588772, 228589017, 22920072, 22960388, 22960435, 22969230, 22971409, 229909386, 229909697, 230185510, 230516405, 230729032, 230758501, 230758639, 23153735, 23153742, 23155792, 23156134, 232520546, 232522034, 23306097, 23307906, 233519998, 233520157, 233520257, 233520425, 233633874, 233657188, 233660801, 23532796, 236401511, 236402747, 236403380, 236403905, 236438668, 236440696, 236441643, 236442380, 236443047, 23727705, 23922939, 24015579, 241017426, 241017568, 241511828, 241512134, 241542047, 24294377, 24294400, 243007180, 24346755, 243777016, 243778818, 243788010, 243788599, 243790334, 243790517, 243791145, 243791329, 243890860, 24396804, 244081145, 244082303, 24419811, 24419822, 24440014, 245617341, 24659699, 24686580, 24713330, 24785057, 24791472, 24814192, 248285248, 248287898, 24839406, 24841520, 24903431, 24903441, 24903474, 250407413, 250407647, 250533235, 250534394, 25158998, 25162389, 252564167, 25317304, 253485047, 253518869, 253518920, 253519495, 254608905, 25535467, 25545089, 255800146, 255800577, 255800783, 25695001, 257342981, 257343434, 257343597, 25740034, 25741198, 257807125, 257807712, 257810065, 257811449, 257812862, 257813288, 257816690, 257829534, 257837994, 257838919, 257840933, 25923196, 25926517, 25974222, 25977812, 26013203, 26014536, 26017478, 261447208, 261762082, 261826406, 261826521, 261826683, 261827192, 262406180, 26417031, 26419811, 26421972, 264289990, 264290413, 264989911, 264990158, 264990548, 264991177, 26673760, 26774629, 26777410, 26777502, 268533320, 268533563, 268533852, 268586231, 26945832, 270560835, 270562881, 271017031, 271017217, 271017537, 271017937, 27133214, 27171403, 27245855, 27312415, 273795078, 273969902, 273970482, 27471379, 27474371, 27477255, 27494652, 277954704, 277955084, 277955605, 277956390, 277963405, 278009025, 27848918, 27848921, 27848937, 27849961, 27854500, 27858062, 27860496, 27902303, 27902388, 27902398, 27902406, 280661926, 280662667, 280662903, 28275809, 28277195, 28277486, 283754518, 283755431, 283756680, 284135286, 28492363, 286526176, 286526788, 286527185, 286527303, 28664212, 28671909, 28672001, 287424278, 287424705, 287425246, 287426148, 29099749, 29100347, 29100449, 29100543, 292044716, 292046825, 292969139, 292969458, 292969932, 292970740, 292971046, 29345958, 294950095, 29532089, 29532111, 29532138, 295460073, 295460702, 295461517, 298085284, 298087401, 29939404, 29957963, 29959768, 29959897, 29959911, 300410436, 300410799, 300436644, 302030998, 302063713, 302280931, 302281291, 302418416, 302502491, 30392263, 30393548, 30393653, 304719869, 304720206, 304720496, 304721834, 305943571, 306163602, 30649735, 306971294, 306971449, 306971659, 30847685, 30847733, 30847746, 30847779, 31314849, 31314931, 31314966, 313532084, 313532207, 313532292, 313536525, 313547087, 313547345, 314534854, 31532496, 315565799, 315573586, 315574690, 315617026, 317592936, 317593132, 317593302, 31839203, 31839260, 31839337, 31839411, 319106687, 319655993, 319656339, 319656563, 321345839, 321582427, 32199868, 323192649, 323477973, 32353654, 32355759, 32355966, 32356064, 325755895, 325758098, 327365543, 32858586, 32858662, 32858699, 32858741, 329021694, 329021959, 329022047, 330295904, 330296114, 330296266, 332747438, 332747874, 332748371, 332755212, 332774000, 33382537, 33382711, 33383241, 334177905, 334523653, 334620158, 334620353, 334620605, 335085355, 335086410, 335087161, 335132838, 336370943, 336371164, 33683368, 33732371, 33866728, 33866846, 33867016, 33867401, 33879504, 341108783, 341109697, 341110180, 34223662, 34247537, 342869414, 343586214, 343587237, 34398653, 34398938, 34399318, 34399428, 346685995, 346686597, 346686979, 346687267, 346687565, 346687946, 34870758, 34898883, 34901961, 35200756, 35201552, 35205409, 35223828, 35226945, 35268363, 35293856, 35366155, 35366215, 356212121, 356212933, 356213216, 356213494, 35682284, 35683911, 35684857, 357834584, 357837444, 35809502, 359178822, 359179120, 359179463, 359244394, 36017373, 36042596, 36042821, 36068233, 36105781, 36107470, 361950297, 361950795, 36270159, 36334760, 36431591, 365631067, 365642085, 365642352, 365674685, 36568384, 36568418, 36568603, 36738142, 36738185, 36784258, 368070589, 36913594, 36913598, 36913601, 37347081, 37347098, 37347141, 375829909, 375832969, 37694889, 37694914, 37816777, 37821008, 37821473, 37821996, 379098145, 380204314, 380210977, 382837475, 382837631, 382837706, 382837862, 382837983, 38326803, 38327125, 383608755, 383609201, 385780758, 387285940, 387286257, 38861951, 390969719, 391005275, 392057539, 39258329, 39258389, 395205750, 395205954, 395449601, 397902579, 398122525, 398122724, 398122908, 398675172, 398675588, 401277404, 402304782, 402305186, 40493542, 40493590, 40493658, 40504724, 405991634, 405996670, 406101128, 40811356, 40892405, 40892781, 409745306, 409746054, 410001793, 413199938, 413200176, 41457484, 41457719, 416846710, 41855117, 41855400, 41856126, 419240423, 419241111, 420160506, 420161128, 420178043, 42067245, 42200159, 42200852, 42201538, 42321801, 424700938, 425120575, 425121415, 427947884, 427948872, 427949130, 42845609, 42845684, 42845853, 42845896, 42847923, 430065768, 430066424, 431038614, 431042935, 431044405, 431045523, 431047232, 43245080, 43245104, 43245478, 43245530, 433922317, 433923430, 434289516, 435116454, 435116927, 43567614, 43708943, 43708954, 439307591, 439988813, 439989184, 44084783, 44115185, 44115926, 44116233, 444457864, 445118715, 445118914, 445119186, 445120580, 445122594, 445122795, 445127715, 445132899, 445136641, 445146200, 445150567, 445151478, 44561343, 44561400, 44561450, 450565762, 450566409, 45094376, 45177979, 45201977, 454733534, 454733927, 454734258, 45513203, 45513247, 456221232, 456226536, 45754061, 45941397, 45941451, 460099901, 46132907, 461488745, 461489128, 462294549, 46360821, 46360870, 46360920, 46362414, 467109039, 467109371, 467137230, 467138029, 467859890, 467895641, 467935723, 46846024, 46846074, 46846115, 46846246, 471751406, 471830826, 472607336, 472607575, 47262108, 47262951, 473287763, 47597760, 47597835, 477910063, 477911027, 478707595, 47871597, 47871615, 47871635, 47871646, 48159648, 48159731, 48159815, 483308034, 483308681, 483899693, 48395736, 48596305, 48596324, 48596336, 48847374, 489196923, 489197999, 49052638, 49052686, 49052716, 49059364, 491599826, 492670565, 492854717, 492979024, 49491716, 49491736, 49491781, 49491808, 498752334, 498752764, 49929724, 49929746, 49929767, 49929776, 501753915, 501755654, 501939119, 501940219, 501941714, 501942750, 501966315, 503955938, 503957396, 503957703, 50454041, 50454086, 507797529, 507803661, 50937815, 50938746, 50938765, 50938773, 511930668, 511931885, 512422543, 512451831, 51302649, 51346271, 51346336, 51346471, 51347716, 515687734, 515687925, 515688182, 515688387, 515688568, 51757126, 51757158, 51757162, 51760061, 517827255, 517827962, 52180858, 52180863, 52180871, 52180878, 521925833, 522586178, 522587921, 52625728, 52625733, 52625744, 52627419, 527383094, 527384527, 52938493, 53130850, 53130867, 53130887, 53130896, 531702150, 532254782, 535104095, 53623248, 53623295, 53623322, 53623350, 536288166, 537374622, 537435862, 537436189, 537436448, 53917288, 54130537, 54130543, 54130552, 54130559, 542184488, 542755101, 54694311, 54694324, 54694329, 54694334, 548019247, 549914420, 549914888, 549915884, 55027987, 55028088, 55192815, 55194474, 55301897, 55302141, 55302225, 553937189, 553939167, 55642223, 55917409, 55917420, 55917429, 55917432, 561842836, 563287969, 563288952, 56561570, 56561579, 56561593, 56561607, 566780253, 566780416, 569676258, 569678090, 57229313, 57229337, 57229357, 57229371, 57902859, 57902997, 57983479, 57983532, 57983650, 579868200, 583007360, 583026228, 583157224, 583159170, 58364871, 58574416, 58574431, 58574445, 58574452, 58880579, 58901335, 58901405, 58901481, 58901534, 58901575, 58921588, 59175769, 59175777, 59190534, 59190543, 59805584, 59806354, 59848474, 59848509, 602145262, 602146440, 60357959, 60357972, 60357982, 60357989, 60678464, 60791062, 608818868, 60888200, 60888225, 60888284, 60888308, 610133129, 610133821, 61459592, 61459678, 61459706, 61459718, 61916108, 61916132, 61916137, 61963621, 621089209, 621090617, 62350846, 62350856, 62350867, 62350883, 62803165, 62803173, 62803186, 62809243, 62827106, 62827121, 629893424, 629895007, 63253676, 63253701, 63253706, 63253718, 635616686, 635636907, 63721700, 63721711, 63721724, 63721732, 638034686, 639343572, 639345143, 64160538, 64160547, 64220933, 64220952, 64372659, 64372667, 64447616, 64647631, 64647651, 64647666, 64735604, 64869906, 64869947, 64870000, 64870021, 65079090, 65079094, 65082246, 65082275, 65347268, 65469817, 65469882, 65469908, 65545955, 65545971, 65546284, 65554735, 65868656, 658805662, 65954788, 65969704, 65969749, 65969758, 65979823, 66416579, 66416590, 66416602, 66416616, 66426103, 66426498, 66823631, 66823689, 66896542, 66896565, 66896601, 66896638, 67319385, 67319408, 67319425, 674103772, 674104921, 67494312, 67747860, 67747884, 67747912, 67755182, 67755192, 67755215, 67798397, 67998086, 68233678, 68354832, 68354853, 68478587, 68539623, 68603151, 68603324, 686806111, 68848741, 69209924, 69210321, 69210407, 69499437, 69499452, 69567827, 69567879, 698862470, 69947367, 69947379, 69964719, 70032387, 70353298, 70476425, 70476435, 70476446, 70476451, 709229848, 709399046, 709400407, 71037028, 71037056, 71037076, 71037101, 71422327, 71422340, 71422361, 71597027, 71597048, 71597060, 71597072, 718234275, 718245473, 718258183, 718259118, 72069827, 72069855, 72069888, 72318993, 725802037, 725802546, 72644603, 72644629, 72644644, 72713855, 728205177, 728207067, 73089166, 73089190, 73089204, 73089214, 73089229, 73089239, 73089259, 73232786, 73232803, 73232825, 73265108, 73799243, 73799348, 73829193, 73829202, 73829214, 73888479, 738924664, 738925737, 74385386, 74385399, 74385418, 74385438, 746686384, 746687364, 74904387, 74904396, 74904413, 74972442, 754869699, 754871615, 75550883, 75550907, 75550928, 75556791, 75906930, 75906942, 75906973, 75941738, 76170471, 76170515, 76170545, 76262706, 76596269, 76596299, 76768897, 77443436, 77443461, 77443491, 77443704, 78005009, 78005022, 78005082, 78026639, 782684707, 78367424, 78665196, 78665204, 78665215, 78730532, 790967234, 790968060, 790968791, 790979662, 79446395, 79446433, 79446454, 79446473, 79736563, 79736586, 80576913, 80576928, 80576952, 80576967, 80597060, 80661504, 806754856, 806882461, 81154592, 81155006, 81330766, 815545408, 81847365, 81847533, 81847570, 81847637, 820013867, 82357079, 82357101, 82357123, 82358339, 82707568, 82707577, 82711866, 82711870, 83021197, 83021217, 83021236, 83021250, 835779898, 835780770, 83704154, 83704165, 83704169, 83704179, 83704190, 84012460, 84417104, 84417281, 84418938, 84419543, 85145626, 85145662, 85145680, 85145730, 85145757, 85150452, 85150872, 85150978, 85754656, 85879435, 85879447, 85879456, 85879465, 86492467, 86492583, 86494893, 86494914, 86692539, 86903805, 87361508, 87361662, 87361806, 87361995, 88143060, 88143074, 88143093, 88143166, 88146486, 88146497, 88146505, 88870392, 88885268, 88885481, 88885497, 88885506, 88885524, 88885539, 89203876, 89203895, 89390416, 89390459, 89487903, 89487934, 89488524, 89491407, 90211299, 90220371, 90220438, 90242059, 90718350, 90718505, 90718618, 90718686, 91294485, 91360028, 91360052, 91360081, 91360104, 91445347, 91445669, 91450692, 91517984, 91518057, 91658290, 92142799, 92142829, 92142841, 92142950, 92627975, 92627988, 92628074, 92628079, 93136666, 93136674, 93136746, 93136802, 93528414, 93536785, 93536827, 93536844, 93536867, 93667422, 93709266, 93722443, 93722515, 93725362, 93746675, 94119269, 94233286, 94233344, 94233367, 94233391, 94333296, 94794774, 94794833, 94794847, 95258660, 95354259, 95354268, 95354288, 95354304, 95484098, 95484354, 95951270, 95951291, 95951330, 95951359, 96092647, 96095000, 96095042, 96493688, 96501417, 96501454, 96669682, 96669687, 96669697, 96669943, 97161222, 97161241, 97161262, 97161295, 97311482, 97712291, 97756645, 97885289, 97885508, 97885552, 97885572, 97886188, 97932897, 98219158, 98253569, 98253592, 98253626, 98253651, 98341183, 98346415, 98411325, 98411393, 98411436, 98970218, 99033296, 99119158, 99119198, 99119240, 99119261, 99130630, 99174250, 99199463, 99206951, 99206970, 99254164, 99254203, 99254241, 99254358, 99254437, 99610601, 99641902, 99797327, 99797357, 99797381, 99797403 }
local connections = {}
local chatconnections = {}

local Utils = {
	Visual = {},
	Task = {},
	Debugging = {}
}

function Utils.Task:wait(a1)
	if a1 == nil or a1 <= 0 then a1 = 1 end
    local __o__w = os.clock()
    a1 = a1 * 0.001
    
    local delta = 0
    repeat delta = task.wait() until os.clock() + delta >= __o__w + a1
    repeat if true then end until __o__w + a1 <= os.clock()
end

function Utils:__wait()
	rns.Heartbeat:Wait()
end

function Utils.getPlr(str)
	local myInput = string.lower(str)
	for i,v in ipairs(plyrs:GetPlayers()) do
		if string.sub(string.lower(v.Character.Name), 1, #myInput) == myInput then 
		   return v.Character.Name
		end
	end
end

shared.banned = { { "p", "Hl_5n" }, { "p", "vnc1e" }, { "p", "Skillfulljm743" } }

local pos1 = nil
local pos2 = nil

local SecureParts

function checkifplayer(name)
    local possibleplayers = {}
    if string.len(name) ~= 0 then
        name = string.lower(name)
        for i,v in pairs(game.Players:GetPlayers()) do
            if string.find(string.lower(v.Name), name) == 1 or string.find(string.lower(v.DisplayName), name) == 1 then
                table.insert(possibleplayers,v.Name)
            end
        end
        if #possibleplayers == 0 then
            return "No player found"
        elseif #possibleplayers == 1 then
            return possibleplayers[1]
        elseif #possibleplayers > 1 then
            return "Multiple players found"
        end
    end
end

for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v.Name == "SecureParts" and v:FindFirstChild("ResetPads") then
        SecureParts = v
    end
end

local prefix = "?"

plr = game.Players.LocalPlayer
_G.prefix = "?"

local Regen = SecureParts.ResetPads

function GetPlayer(target)
    local plrs = game:service("Players"):GetPlayers()
    if target:lower() == "all" then
        return plrs
    elseif target:lower() == "others" then
        for index, plr in pairs(plrs) do
            if plr == game:service("Players").LocalPlayer then
                table.remove(plrs, index)
                return plrs
            end
        end
    elseif target:lower() == "me" then
        return {game:service("Players").LocalPlayer}
    else
        local plrTargets = {}
        for index, plr in pairs(plrs) do
            if plr.Name:sub(1, #target):lower() == target:lower() or plr.DisplayName:sub(1, #target):lower() == target:lower()  then
                table.insert(plrTargets, plr)
            end
        end
        return plrTargets
    end
end

local Pads = SecureParts.AdminPads:GetChildren()

local PermPad = Pads[math.random(1, #Pads)]

local function nilmap()
    workspace.Gravity = 0
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Part") then
            v.CanCollide = false
        end
    end
end

local function unnilmap()
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Part") then
            v.CanCollide = true
        end
    end
    workspace.Gravity = 198.2
end

local function regen(s)
    nilmap()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Regen.CFrame
    wait(.25)
    fireclickdetector(Regen.ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = s
    unnilmap()
end

local function touchpad(p,s)
    nilmap()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p.CFrame
    task.wait(.25)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, p, 0)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, p, 1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = s
    unnilmap()
end


touchpad(PermPad.Head, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)

function Utils.pkick(plr)
	local thread = coroutine.create(function()
		KickPlayer(plr, false)
		local plr = Utils.getPlr(plr)
	end)
	coroutine.resume(thread)
end

function Utils.nkick(plr)
	local thread = coroutine.create(function()
		local char = game.Players:FindFirstChild(plr).Character
        requireFex():InvokeServer("Remove", {char})
		local plr = Utils.getPlr(plr)
	end)
	coroutine.resume(thread)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local project = "idk yet"

function encrypt(a,b)local c=string.byte;local d=string.sub;local e=string.char;local f={}for g=1,#a do local h=g%#b+1;f[g]=e((c(d(a,g,g))+c(d(b,h,h)))%126+1)end;f=table.concat(f)return f end
function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end

function Notify(title, msg, ...) 
    local args = {...}

    if args[1] then
        Notification:Notify(
            {Title = title, Description = msg},
            {OutlineColor = Color3.fromRGB(86, 84, 240),Time = 5, Type = "option"},
            {Callback = args[1]}
        )
    else
        Notification:Notify(
            {Title = title, Description = msg},
            {OutlineColor = Color3.fromRGB(86, 84, 240),Time = 5, Type = "default"}
        )
    end
end

function IsItemAllowed(Item)
	local IsItemClassAllowed = (Item:IsA 'BasePart' and not Item:IsA 'Terrain') or
		(Item:IsA 'Model' and not Item:IsA 'Workspace') or
		Item:IsA 'Folder' or
		Item:IsA 'Smoke' or
		Item:IsA 'Fire' or
		Item:IsA 'Sparkles' or
		Item:IsA 'DataModelMesh' or
		Item:IsA 'Decal' or
		Item:IsA 'Texture' or
		Item:IsA 'Light'
	if not IsItemClassAllowed then
		return false
	end

	if Item.Name == "SecureParts" or Item:IsDescendantOf(game.Workspace.SecureParts) then
		return false
	end

    if Item.Name == "BuildingBlocks" and Item:IsA("Folder") then
        return false
    end

	if Item:IsDescendantOf(game.Workspace) then
		return true
	end

	return false

end

if game.PlaceId ~= 333164326 then
    Notify(project, "The game isn't Admin House. Aborting!")
    do return end
end

getgenv().Key = " .. getgenv().Remote.Name .. "
if getgenv().Key == nil then 
    Notify(project, "Adonis key not found. Rejoining in 3 seconds to obtain the key")
    task.wait(3)
    game:GetService("TeleportService"):Teleport(game.PlaceId,LocalPlayer)
    do return end
end

if getgenv().SYNExec == true then
    Notify(project, "An instance of " .. project .. " is already running.")
    do return end
end

getgenv().SYNExec = true

function reset()
    local char = LocalPlayer.Character
    if char then 
        local oldpos = char.HumanoidRootPart.CFrame
        requireFex():InvokeServer("Remove", {char})
        runCmd(":re")
        local new = LocalPlayer.CharacterAdded:Wait()
        new:WaitForChild("HumanoidRootPart").CFrame = oldpos
        return true
    else
        runCmd(":re")
    end

    return false
end

function Set (list)
    local set = {}
    for _, l in ipairs(list) do set[l] = true end
    return set
end

function getIndex(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end

function startswith(selfx, str) 
    return selfx:find('^' .. str) ~= nil
end

local isWaiting = false
getgenv().latestEndpoint = "    "
function requireFex()

    
    if game.Workspace:FindFirstChild(LocalPlayer.Name .. "_ADONISJAIL") and LocalPlayer.Backpack:FindFirstChild(getgenv().latestEndpoint) then
        UnjailPlayer(LocalPlayer.Name)
    elseif game.Workspace:FindFirstChild(LocalPlayer.Name .. "_ADONISJAIL") then
        runCmd(":free")
    end

    if LocalPlayer.Backpack:FindFirstChild(getgenv().latestEndpoint) then
        local fold = LocalPlayer.Backpack:FindFirstChild(getgenv().latestEndpoint)
        local sync = fold:WaitForChild("SyncAPI")
        local server = sync:WaitForChild("ServerEndpoint")

        return server
        
    end

    if (isWaiting == false) and LocalPlayer.Backpack:FindFirstChild(getgenv().latestEndpoint) == nil then 
        isWaiting = true

        runCmd(":f3x")
        local foldr = LocalPlayer.Backpack:WaitForChild("Folder", 4)
        foldr:WaitForChild("RealToolTag").Value.Name = "I <3 TECH F3X"

        local syncAPI = foldr:WaitForChild("SyncAPI", 4)
        local serv = syncAPI:WaitForChild("ServerEndpoint", 4)

        
        if foldr ~= nil and syncAPI ~= nil and serv ~= nil then

            isWaiting = false

            foldr.Name = tostring(math.random(1, 99999999))
            getgenv().latestEndpoint = foldr.Name
            return serv
        else
            isWaiting = false
            --return requireFex()
        end


    end
end

getgenv().requireFex = requireFex


function UnjailPlayer(username)
    local jail = game.Workspace:FindFirstChild(username .. "_ADONISJAIL")
    if jail then
        requireFex():InvokeServer("Remove", {jail})
    end
end

function KillPlayer(username)

    local plr = game.Players:FindFirstChild(username)
    if plr == nil then Notify(project, "Player left."); return; end

    if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("Humanoid").Health > 0 then
        local childs = plr.Character:GetChildren()
        local clone = {}
        for i,v in pairs(childs) do
            if v:IsA("BasePart") then
                table.insert(clone, v)
            end
        end

        table.remove(clone, #clone) -- delete an element to break character integrity
        requireFex():InvokeServer("Clone", clone, plr.Character)
        return true
    end
end

function KickPlayer(username, isLight)

local loadres = getgenv().loadBuild("deconn1")

    if loadres.Success ~= true then
        Notify(project, "Loading didnt succeed? check if build is loaded!")
        --ickPlayer(username, isLight)
    end

    local skpart
    for i, v in pairs (loadres.Objects) do
        if v.ClassName == "SkateboardPlatform" then
            skpart = v
            break
        end
    end

    
    if game.Players:FindFirstChild(username) == nil then
        Notify(project, "Player left the game")
        loadres.Clear()
        return -1
    end

    UnjailPlayer(username)

    if game.Players[username].Character then
        requireFex():InvokeServer("Remove", {game.Players[username].Character})
    end
    print("Refreshing started!")
    runCmd(":re " .. username)
    local fresh = game.Players:FindFirstChild(username).CharacterAdded:Wait()

    print("Refreshing done!")
    local start = os.clock()

    local PlayerPair = {skpart, fresh}
    print("Grouping started!")
    local res = requireFex():InvokeServer("CreateGroup", "Model", game.Workspace, PlayerPair)
    print("Grouping done!")
    if res:IsA("Model") == false or res:FindFirstChild(username) ~= game.Players:FindFirstChild(username).Character then
        Notify(project, 'Grouping failed! Please retry')
        loadres.Clear()
        return false
    end

    if isLight then 
        runCmd(":jump " .. username .. " ")
    end

    local kickcommand = ":tp " .. username .. " wp-psy|:sit " .. username .. "|:fview " .. username .. " me "
    print("Executed cmd!")
    runCmd(kickcommand)
    
    local timeout = os.clock()
    while task.wait() do 
        if game.Players[username] == nil then
            Notify(project, "Player left.")
            loadres.Clear()
            break;
        end

        if skpart.ControllingHumanoid == fresh.Humanoid then
            break;
        end

        local retry = 0

        if os.clock() - timeout >= 5 then
            if game.Players[username].Character == fresh and skpart.Parent ~= nil and skpart:FindFirstChild(username) == game.Players[username].Character and retry < 2 then
                Notify(project, "Timeout reached with the objects.. Retrying")
                timeout = os.clock()
                runCmd(kickcommand)    
                retry = retry + 1        
            else
                Notify(project, "5 second timeout reached. Aborting")
                loadres.Clear()
                return -1
            end
        end
    end
    print("done!")

    if isLight then
        if username ~= fresh.Humanoid.DisplayName then
            runCmd(":chatnotifyc all 0 160 255 " .. LocalPlayer.Name .. " has used the Ban Hammer on " .. fresh.Humanoid.DisplayName .. " (" .. username .. ")")
        else
            runCmd(":chatnotifyc all 0 160 255 " .. LocalPlayer.Name " has used the Ban Hammer on " .. username)
        end
    end

    loadres.Clear()
    
    Notify(project, "Kick completed! Took " .. os.clock() - start .. " secs")
    return 0
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib(project, "BloodTheme")

local Tab = Window:NewTab("Exploits")
local Section = Tab:NewSection("R6 Exploit")
local Kick = Tab:NewSection("Special Tools")
local PlrMisc = Tab:NewSection("Player")

local ServerTab = Window:NewTab("Server")
local Misc = ServerTab:NewSection("Misc")

local lplrTab = Window:NewTab("LocalPlayer")
local LPChar = lplrTab:NewSection("Character")
local LPSettings = lplrTab:NewSection("Settings")

local playerDrops = {}

local plrs = {}
local blacklist = { "" }
local wl = {LocalPlayer.Name}

for i, player in pairs(Players:GetPlayers()) do
    table.insert(plrs, player.Name)
end 


-- R6 Abuse Section Start
table.insert(playerDrops, Section:NewDropdown("Choose user", "User to be abused", plrs, function(currentOption)
    currentAbusing = currentOption
    getgenv().abooz = currentOption
end))


Section:NewToggle("Abuse", "Abuses the user", function(state)
    isAbusing = state
end)
-- R6 Abuse Section End

-- Special Tools Section Start


Kick:NewButton("Kick Hammer", "Gives you a hammer that crashes people!", function()
    runCmd(":gear me 10468797")
    local hamm = LocalPlayer.Backpack:WaitForChild("BanHammer V1.1")
    --hamm.Parent = LocalPlayer.Character
    hamm.Name = tostring(math.random(1, 999999))
    local hndle = hamm:WaitForChild("Handle")
    
    local debounce = false

    hndle.Touched:Connect(function(obj)
       if debounce == false and obj.Parent.Name ~= LocalPlayer.Name and game.Players:GetPlayerFromCharacter(obj.Parent) then
            debounce = true

            if hamm.Parent == game.Workspace or hamm.Parent == obj.Parent then
                hamm:Destroy()
                runCmd(":notify " .. obj.Parent.Name .. " This weighs too much for you." )
                KillPlayer(obj.Parent.Name)
                debounce = false
                return;
            end
            KickPlayer(obj.Parent.Name, true)
            debounce = false
       end
        
    end)

    Notify(project, "Kick Hammer acquired. Use it wisely bud")
end)

Kick:NewButton("Unjail Potion", "Gives you a potion that unjails people!", function()
    runCmd(":gear me 72713855")
    local hamm = LocalPlayer.Backpack:WaitForChild("GigantoformPotion")
    --hamm.Parent = LocalPlayer.Character
    hamm.Name = tostring(math.random(1, 999999))
    local hndle = hamm:WaitForChild("Handle")
    
    local debounce = false

    hndle.Touched:Connect(function(obj)
       if debounce == false and obj.Parent.Name ~= LocalPlayer.Name and game.Players:GetPlayerFromCharacter(obj.Parent) then
            debounce = true

            if hamm.Parent == game.Workspace or hamm.Parent == obj.Parent then
                hamm:Destroy()
                runCmd(":notify " .. obj.Parent.Name .. " This weighs too much for you." )
                KillPlayer(obj.Parent.Name)
                debounce = false
                return;
            end

            UnjailPlayer(obj.Parent.Name)
            debounce = false
       end
        
    end)

    Notify(project, "Unjailer acquired. Use it wisely bud")
end)

Kick:NewButton("Eternal Sword", "Gives you a sword that even kills people with god or ff!", function()
    runCmd(":sword")
    local hamm = LocalPlayer.Backpack:WaitForChild("LinkedSword")
    --hamm.Parent = LocalPlayer.Character
    hamm.Name = tostring(math.random(1, 999999))
    local hndle = hamm:WaitForChild("Handle")
    
    local debounce = false

    hndle.Touched:Connect(function(obj)
       if debounce == false and obj.Parent.Name ~= LocalPlayer.Name and game.Players:GetPlayerFromCharacter(obj.Parent) then
            debounce = true

            if hamm.Parent == game.Workspace or hamm.Parent == obj.Parent then
                hamm:Destroy()
                runCmd(":notify " .. obj.Parent.Name .. " This weighs too much for you." )
                KillPlayer(obj.Parent.Name)
                debounce = false
                return;
            end

            KillPlayer(obj.Parent.Name)
            requireFex():InvokeServer("Remove", {obj.Parent})
            debounce = false
       end
        
    end)

    Notify(project, "Eternal Sword. Use it wisely bud")
end)




-- Special Tools Section End

-- Misc Section Start

table.insert(playerDrops, PlrMisc:NewDropdown("Choose user", "User to be unjailed", plrs, function(currentOption)
    miscUser = currentOption
end))

PlrMisc:NewButton("Kick", "Kicks the selected player", function()
    KickPlayer(miscUser, false)
    wait(1.35)
    local build = getgenv().loadBuild("astral")

    Notify(project, "Build loaded... Crashing")

    UnjailPlayer(target)
    runCmd(":fviewcam " .. miscUser .. " blbox")
    task.wait(4)
    runCmd(":re " .. miscUser ..  "|:tp " .. miscUser .. " 666,666666,666")

    local start = os.clock()

    while task.wait() do
        if os.clock() - start >= 5 then
            Notify(project, "Crash failed. Timeout reached")
            return false
        end

        if game.Players:FindFirstChild(miscUser) == nil then
            Notify(project, "Player crashed beforehand.")
            return;
        end

        if game.Players:FindFirstChild(miscUser).Character then
            local char = game.Players:FindFirstChild(miscUser).Character
            local hum = char.HumanoidRootPart
            if hum.Position.X == 666 and hum.Position.Y == 666666 and hum.Position.Z == 666 then
                break;
            end
        end
    end
    
    --build.Clear()
    KillPlayer(miscUser)

    Notify(project, "Crash successful!")
    return true 
end)

function add(name, func, isplayer)
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
        local split = string.split(msg," ")
        local lower = string.lower(split[1])
        
        if lower == _G. prefix .. name then
            if isplayer then
                func(split[2])
            else
                func()
            end
        end
    end)
end

add("kick", function(target)
    local checked = checkifplayer(target)
    KickPlayer(checked)

    local start = os.clock()

    while task.wait() do
        if os.clock() - start >= 5 then
            Notify(project, "Crash failed. Timeout reached")
            return false
        end

        if game.Players:FindFirstChild(target) == nil then
            Notify(project, "Player crashed beforehand.")
            return;
        end

        if game.Players:FindFirstChild(target).Character then
            local char = game.Players:FindFirstChild(target).Character
            local hum = char.HumanoidRootPart
            if hum.Position.X == 666 and hum.Position.Y == 666666 and hum.Position.Z == 666 then
                break;
            end
        end
    end
    
    --build.Clear()
    KillPlayer(target)

    Notify(project, "Crash successful!")
    return true 
end, true)

add("pban", function(target)
    local checked = checkifplayer(target)
    KickPlayer(checked)
    table.insert(shared.banned, { "p", Utils.getPlr(checked) })
	Utils.pkick(checked)
    runCmd(":notify " .. checked .. " try harder next time... ur blacklisted")
end, true)


PlrMisc:NewButton("Crash", "Crashes the selected player", function()
    local build = getgenv().loadBuild("astral")

    Notify(project, "Build loaded... Crashing")

    UnjailPlayer(miscUser)
    runCmd(":npm ".. miscUser .." imagine getting hard crashed L|:fviewcam " .. miscUser .. " blbox")
    task.wait(4)
    runCmd(":re " .. miscUser ..  "|:tp " .. miscUser .. " 666,666666,666")

    local start = os.clock()

    while task.wait() do
        if os.clock() - start >= 5 then
            Notify(project, "Crash failed. Timeout reached")
            return false
        end

        if game.Players:FindFirstChild(miscUser) == nil then
            Notify(project, "Player left.")
            return;
        end

        if game.Players:FindFirstChild(miscUser).Character then
            local char = game.Players:FindFirstChild(miscUser).Character
            local hum = char.HumanoidRootPart
            if hum.Position.X == 666 and hum.Position.Y == 666666 and hum.Position.Z == 666 then
                break;
            end
        end
    end
    
    build.Clear()
    KillPlayer(miscUser)

    Notify(project, "Crash successful!")
    return true 
end)

PlrMisc:NewButton("Name Crash", "Fatal errors the player", function()
    local build = loadBuild("namecerrSYN")
    runCmd(string.format(":re %s|:tp %s wp-namecerr|:talk %s %s", miscUser, miscUser, miscUser, ("#"):rep(50000) ))
    wait(5)
    build.Clear()
    return 0 
end)

PlrMisc:NewButton("Kill", "Silently kills the selected player", function()
    KillPlayer(miscUser)
end)

PlrMisc:NewButton("Unjail", "Silently unjails the selected player", function()
    UnjailPlayer(miscUser)
end)

PlrMisc:NewButton("Punish", "Silently punishes the player", function() 
    local char = game.Players:FindFirstChild(miscUser).Character
    requireFex():InvokeServer("Remove", {char})
end)

PlrMisc:NewButton("Ungroup", "Silently ungroups the player", function() 
    local char = game.Players:FindFirstChild(miscUser).Character
    requireFex():InvokeServer("Ungroup", {char})
end)

-- Misc Section End

-- ServerMisc Section Start
Misc:NewButton("Kill Others", "Kills everyone except you in the server regardless of their ff or god", function()

    for i,v in pairs(Players:GetPlayers()) do 
        if v.Name ~= LocalPlayer.Name then 
            KillPlayer(v.Name)
        end
    end

end)

Misc:NewButton("Rejoin", "Rejoins the same server.", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId,LocalPlayer)
end)

Misc:NewButton("Disable antirunc/loadb", "runc gets used by crashers 90% of the time anyway, same goes for loadb", function()
    antirunc = false
    runCmd(":chatnotifyc all 0 255 0 Dissolve's Automod has been disabled... uh oh?")
    for _, connection in ipairs(chatconnections) do
        connection:Disconnect()
    end
end)

Misc:NewButton("Enable antirunc/loadb", "runc gets used by crashers 90% of the time anyway, same goes for loadb", function()
    antirunc = true
    runCmd(":chatnotifyc all 0 255 0 {Dissolved} - Automod has been enabled. Any abusive commands (INCLUDING LOADB AND RUNC) will be filtered out and whoever tries to sue these commands will be automatically kicked.")
    for _, connection in ipairs(chatconnections) do
        connection:Disconnect()
    end
end)

Misc:NewButton("Regen", "Resets admin", function()
    local humanoid = LocalPlayer.Character.HumanoidRootPart
    local oldpos = humanoid.CFrame
    humanoid:PivotTo(game.Workspace.SecureParts.ResetPads.CFrame)
    task.wait(0.1)
    humanoid.Anchored = true
    fireclickdetector(game.Workspace.SecureParts.ResetPads.ClickDetector)
    task.wait(0.3)
    humanoid.Anchored = false
    humanoid.CFrame = oldpos
end)

Misc:NewButton("Clear Workspace", "Deletes all parts in the workspace excluding players.", function()

    local children = game.Workspace:WaitForChild("BuildingBlocks"):GetChildren()

    local players = game.Players:GetChildren()
    
    local isLocked -- prevent running unnecessary clean command

    for _, child in pairs(game.Workspace:GetChildren()) do
        if child:IsA("Accessory") or child:IsA("Tool") and isLocked == false then 
            isLocked = true 
        end
        if IsItemAllowed(child) then
            table.insert(children, child)
        end
    end
    
    for i = 1, #players do
        if (players[i].Character) then
        local index = getIndex(children, players[i].Character)
        table.remove(children, index)
        end
    end 

    for i,v in ipairs(getgenv().deletedParts) do
        table.insert(children, v)
    end
    
    if isLocked then
        runCmd("!clean")
    end

    if workspace.Terrain:CountCells() ~= 0 then
        runCmd(":clearterrain")
    end

    if #children > 0 then
        requireFex():InvokeServer("Remove", children)
    end

    getgenv().deletedParts = {}

    Notify(project, "Cleared " .. #children .. " parts! Would you like to undo it?", function(state)
        if state == true then
            requireFex():InvokeServer("UndoRemove", children)
        end
    end)
end)

Misc:NewButton("Fix Server", "Cleans the server", function()

    local children = game.Workspace:WaitForChild("BuildingBlocks"):GetChildren()

    local players = game.Players:GetChildren()
    
    local isLocked -- prevent running unnecessary clean command

    for _, child in pairs(game.Workspace:GetChildren()) do
        if child:IsA("Accessory") or child:IsA("Tool") then 
            isLocked = true 
        end
        if IsItemAllowed(child) then
            table.insert(children, child)
        end
    end
    
    for i = 1, #players do
        if (players[i].Character) then
        local index = getIndex(children, players[i].Character)
        table.remove(children, index)
        end
    end 

    for i,v in ipairs(getgenv().deletedParts) do
        table.insert(children, v)
    end
    
    if isLocked then
        runCmd("!clean")
    end

    runCmd(":clearterrain")
    if #children > 0 then
        requireFex():InvokeServer("Remove", children)
    end

    getgenv().deletedParts = {}

    if state == true then
        requireFex():InvokeServer("UndoRemove", children)
    end

    runCmd(":fix|:music")

end)

Misc:NewButton("shutdown 1", "Crash the server using the build", function()
    Notify(project, "Are you sure you want to do this?", function(state)
        runCmd(":loadb test")
        wait(10)
        game.Players:Chat(":loadb test") -- In case you don't have the remote
    end)
end)

Misc:NewButton("shortcut themed crash :)", "you must have the crash saved btw!", function()
    Notify(project, "shortcut on TOP... right?", function(state)
        runCmd(":runc sc")
        wait(10)
        game.Players:Chat(":runc sc") -- I love dudes
    end)
end)

Misc:NewButton("Server lock (build)", "Use a spawn build to keep the server locked", function()
    Notify(project, "Are you sure you want to do this?", function(state)
        getgenv().loadBuild("nlock")
        runCmd("!wait 6|:re others,-friends,-t_echr,-K2phz,-KungFu")
    end)
end)

-- ServerMisc end

LPChar:NewButton("Reset", "Resets your character at last pos", function()
    reset() 
end)

LPChar:NewSlider("Walkspeed", "Changes your walkspeed", 350, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

LPSettings:NewToggle("Auto-kick crashers", "Rip people with perm", function()
    antiperm1 = state
    -- This is just temporarily as I don't know how tf Synaptic's handler works. I'm too used to my own stuff :sob:
	if globalantiperm == true then
        execCmd("rejoin")
        return
    end

    getgenv().globalantiperm = true

    local id = 1293677
    local function addperm(plr)
    if string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. plr.UserId .. "/items/GamePass/" .. id), id) then
        game.Players:Chat("?kick " .. plr.Name)
    end
end

game.Players.PlayerAdded:Connect(function(p)
	addperm(p)
end)
end)

LPSettings:NewToggle("Anti Lag", "Destroys all parts with crash in", function(state)
    getgenv().conga = state    
end)

LPSettings:NewToggle("Anti Camera", "Protects your camera from lags", function(state)
    anticam = state
end)

LPSettings:NewToggle("Auto Lock", "Locks your character when u get unlocked", function (state)
    autolock = state
end)

LPSettings:NewToggle("Auto Unfreeze", "Unfreezes your character automatically", function (state)
    autothaw = state

end)

LPSettings:NewToggle("Fast Refresh", "Refreshes your character when you die auto", function (state)
    fastrefr = state
end)

LPSettings:NewKeybind("Run Flynoclip & God", "", Enum.KeyCode.F, function()
    if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart and LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Flyv2") == nil then
        runCmd(":flynoclip|:god")
    elseif LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart and LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Flyv2") ~= nil then
        runCmd(":god")
    end
end)


LPSettings:NewKeybind("Toggle UI", "Opens or closes the gui", Enum.KeyCode.R, function()
	Library:ToggleUI()
end)



Players.PlayerAdded:Connect(function(player)
    plrs = {}
    for i, player in pairs(Players:GetPlayers()) do
        table.insert(plrs, player.Name)
    end

    for i, v in ipairs(playerDrops) do
        v:Refresh(plrs)
    end

    Notify(project, string.format("%s (%s) joined", player.DisplayName, player.Name))
end)

 
Players.PlayerRemoving:Connect(function(player)
	plrs = {}
    for i, player in pairs(Players:GetPlayers()) do
        table.insert(plrs, player.Name)
    end

	for i,v in ipairs(playerDrops) do
        v:Refresh(plrs)
    end
end)

local joinHook = plyrs.PlayerAdded:Connect(function(plr)
		task.spawn(function()
			wait(1)
			for i,t in ipairs(shared.banned) do
				if t[1] == "p" and plr.Name == t[2] then
					Utils.pkick(t[2])
				elseif t[1] == "n" and plr.Name == t[2] then
					Utils.nkick(t[2])
				--[[elseif t[1] == "m" and plr.Name == t[2] then
					Utils.mkick(t[2])]]
				end
			end
		end)
	end)
table.insert(connections, joinHook)



local hpdeb = false

local ldeb = false
LocalPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    local hrp = char:WaitForChild("HumanoidRootPart")

    hum:GetPropertyChangedSignal("Health"):Connect(function()
        if hum.Health <= 0 and hpdeb == false and fastrefr then
            hpdeb = true
            pcall(reset)
            hpdeb = false
        end
    end)

    hrp:GetPropertyChangedSignal("Locked"):Connect(function()
        if autolock then
            if hrp.Locked == false then
                local ldeb = true 
                runCmd(":lock")
                hrp.Locked = true
            end
        end
    end)

    hrp:GetPropertyChangedSignal("Anchored"):Connect(function() 
        if autothaw and hrp.Anchored == true then
            task.wait()
            runCmd(":thaw me")
        end
    
    end)

end)


local bp = game.Workspace.SecureParts.Baseplate
bp:GetPropertyChangedSignal("Velocity"):Connect(function()
    bp.Velocity = Vector3.new(0, 0, 0)
end)

local loop = coroutine.create(function()
	while task.wait() do 
		pcall(requireFex)
        pcall(function() isWaiting = false end) -- incase its not been setten to false.
	end
end)

local function fixcam()
    if workspace.CurrentCamera.CameraSubject ~= LocalPlayer.Character.Humanoid then
        workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
    end
end

local anticamera = coroutine.create(function()
	while task.wait() do 
        if anticam then
            pcall(fixcam)
        end
	end
end)

local antiperm1 = coroutine.create(function()
    
end)

local r6spam = coroutine.create(function()
	while task.wait() do 
        if isAbusing then
            pcall(runCmd, ":r6 " .. currentAbusing)
        end
	end
end)
 
coroutine.resume(loop)   
coroutine.resume(anticamera)             
coroutine.resume(r6spam)

-- addpoint

add("test", function()
    print("Hello world!")
end)

add("bs1", function()
    print("Running build stealer 1 (Creds: Vecko)")
end)

add("bs2", function()
    print("Running build stealer 2 (Creds: Funzy)")
end)

add("clean", function()

    local children = game.Workspace:WaitForChild("BuildingBlocks"):GetChildren()

    local players = game.Players:GetChildren()
    
    local isLocked -- prevent running unnecessary clean command

    for _, child in pairs(game.Workspace:GetChildren()) do
        if child:IsA("Accessory") or child:IsA("Tool") and isLocked == false then 
            isLocked = true 
        end
        if IsItemAllowed(child) then
            table.insert(children, child)
        end
    end
    
    for i = 1, #players do
        if (players[i].Character) then
        local index = getIndex(children, players[i].Character)
        table.remove(children, index)
        end
    end 

    for i,v in ipairs(getgenv().deletedParts) do
        table.insert(children, v)
    end

    if isLocked then
        runCmd("!clean")
    end

    if workspace.Terrain:CountCells() ~= 0 then
        runCmd(":clearterrain")
    end

    if #children > 0 then
        requireFex():InvokeServer("Remove", children)
    end

    getgenv().deletedParts = {}

    Notify(project, "Cleared " .. #children .. " parts! Would you like to undo it?", function(state)
        if state == true then
            requireFex():InvokeServer("UndoRemove", children)
        end
    end)
end)

wait(1.1)
runCmd(":r6 me")
Notify(project, "ay bro remember that today is gonna be a new day. stay strong brotha!")

game.StarterGui.ResetPlayerGuiOnSpawn = false

function hasGamepass(plrId, id)
    local plrData = game:HttpGet("https://inventory.roblox.com/v1/users/" .. plrId .. "/items/GamePass/" .. id)
    local hasPerm = false
    if string.match(plrData, tostring(id)) then
        hasPerm = true
    end
    return hasPerm
end

plr.Chatted:Connect(function(msg)
    if ndetectorrr then 
        for _, v in pairs(game.Players:GetPlayers()) do
            local connection = v.Chatted:Connect(function(message)
            if msg:lower():find("runc") and v ~= game.Players.LocalPlayer or msg:lower():find("loadb") and v ~= game.Players.LocalPlayer or msg:lower():find("loadc") and v ~= game.Players.LocalPlayer or msg:lower():find("fviewcam") and v~= game.Players.Localplayer then
                    print(":runc or loadb detected")
                    if antirunc == true then
                        if chatcooldown then return end
                        chatcooldown = true
                        game.Players:Chat("?kick "..v.Name)
							runCmd(":chatnotifyc all 0 255 0 {Dissolved} - ".. checked .." has been kicked for going against the automod rules. Blacklisted Message - [".. msg .."] See-ya")
                        wait(.35)
                        chatcooldown = false
                    end
                end
            end)
            table.insert(chatconnections, connection)
        end
    end
end)

wait(.35)

task.spawn(function()
    pcall(function()
        local file = readfile("synahstartupcommands.txt")
        for command in file:gmatch("[^\r\n]+") do 
            print("start-up test")
            if shared.nperm == true then
                wait(5)
            end
            game.Players:Chat(command)
            print(command)
        end
    end)
end)

local PlayerList = Instance.new("ScreenGui")

coroutine.wrap(function()
        -- Instances:

        local PlayerListMaster = Instance.new("Frame")
        local SizeOffsetFrame = Instance.new("Frame")
        local UIListLayout = Instance.new("UIListLayout")
        local ScrollingFrameContainer = Instance.new("Frame")
        local UIListLayout_2 = Instance.new("UIListLayout")

        --Properties:

        PlayerList.Name = "PlayerList"
        PlayerList.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        PlayerList.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        PlayerList.DisplayOrder = 1

        PlayerListMaster.Name = "PlayerListMaster"
        PlayerListMaster.Parent = PlayerList
        PlayerListMaster.AnchorPoint = Vector2.new(1, 0)
        PlayerListMaster.BackgroundTransparency = 1.000
        PlayerListMaster.Position = UDim2.new(1, -4, 0, 40)
        PlayerListMaster.Size = UDim2.new(0, 166, 0.1, 0)

        SizeOffsetFrame.Name = "SizeOffsetFrame"
        SizeOffsetFrame.Parent = PlayerListMaster
        SizeOffsetFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        SizeOffsetFrame.BackgroundTransparency = 1.000
        SizeOffsetFrame.Position = UDim2.new(0.5, 0, 0.881410241, 0)
        SizeOffsetFrame.Size = UDim2.new(1, 0, 2.5, 0) -- {1, 0},{3.003, 0}

        UIListLayout.Parent = SizeOffsetFrame
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        ScrollingFrameContainer.Name = "ScrollingFrameContainer"
        ScrollingFrameContainer.Parent = SizeOffsetFrame
        ScrollingFrameContainer.BackgroundColor3 = Color3.fromRGB(31, 33, 35)
        ScrollingFrameContainer.BackgroundTransparency = 0.300
        ScrollingFrameContainer.BorderSizePixel = 0
        ScrollingFrameContainer.LayoutOrder = 3
        ScrollingFrameContainer.Position = UDim2.new(0, 0, 0.0145454546, 0)
        ScrollingFrameContainer.Size = UDim2.new(1, 0, 0.883456707, 40)

        UIListLayout_2.Parent = ScrollingFrameContainer
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

        -- Scripts:

        local function KTJYHGG_fake_script()
            local script = Instance.new("LocalScript", ScrollingFrameContainer)

            function addBox(isPerm, plrName, plrDisplay)
                local PlayerHere = Instance.new("Frame")
                local ChildrenFrame = Instance.new("Frame")
                local NameFrame = Instance.new("Frame")
                local DisplayName = Instance.new("Frame")
                local PlayerName = Instance.new("TextLabel")
                local SizeConstraint = Instance.new("UITextSizeConstraint")
                local PermUI = Instance.new("Frame")
                local PlayerName_2 = Instance.new("TextLabel")
                local SizeConstraint_2 = Instance.new("UITextSizeConstraint")
                local PlayerName_3 = Instance.new("Frame")
                local PlayerName_4 = Instance.new("TextLabel")
                local SizeConstraint_3 = Instance.new("UITextSizeConstraint")
                local Layout = Instance.new("UIListLayout")

                PlayerHere.Name = plrName
                PlayerHere.Parent = script.Parent
                PlayerHere.BackgroundTransparency = 1.000
                PlayerHere.ClipsDescendants = true
                PlayerHere.Size = UDim2.new(1, 0, 0.158816129, 0)

                ChildrenFrame.Name = "ChildrenFrame"
                ChildrenFrame.Parent = PlayerHere
                ChildrenFrame.BackgroundTransparency = 1.000
                ChildrenFrame.Size = UDim2.new(1, 0, 0, 40)

                NameFrame.Name = "NameFrame"
                NameFrame.Parent = ChildrenFrame
                NameFrame.BackgroundTransparency = 1.000
                NameFrame.Size = UDim2.new(0, 150, 0, 40)

                DisplayName.Name = "DisplayName"
                DisplayName.Parent = NameFrame
                DisplayName.BackgroundTransparency = 1.000
                DisplayName.LayoutOrder = 3
                DisplayName.Position = UDim2.new(0.0799999982, 0, 0, 0)
                DisplayName.Size = UDim2.new(0.639999986, -34, 1, 0)

                PlayerName.Name = "PlayerName"
                PlayerName.Parent = DisplayName
                PlayerName.BackgroundTransparency = 1.000
                PlayerName.Position = UDim2.new(0.439606011, 0, 0.704999983, 0)
                PlayerName.Size = UDim2.new(1, 0, 0.439999998, 0)
                PlayerName.Font = Enum.Font.GothamSemibold
                PlayerName.Text = plrDisplay
                PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
                PlayerName.TextScaled = true
                PlayerName.TextSize = 14.000
                PlayerName.TextWrapped = true
                PlayerName.TextXAlignment = Enum.TextXAlignment.Left

                SizeConstraint.Name = "SizeConstraint"
                SizeConstraint.Parent = PlayerName
                SizeConstraint.MaxTextSize = 14
                SizeConstraint.MinTextSize = 9

                PermUI.Name = "PermUI"
                PermUI.Parent = NameFrame
                PermUI.BackgroundTransparency = 1.000
                PermUI.LayoutOrder = 3
                PermUI.Position = UDim2.new(0.0799999982, 0, 0, 0)
                PermUI.Size = UDim2.new(0.446666658, -34, 1, 0)

                PlayerName_2.Name = "PlayerName"
                PlayerName_2.Parent = PermUI
                PlayerName_2.BackgroundTransparency = 1.000
                PlayerName_2.Position = UDim2.new(0, 0, 0.280000001, 0)
                PlayerName_2.Size = UDim2.new(1, 0, 0.439999998, 0)
                PlayerName_2.Font = Enum.Font.GothamSemibold
                PlayerName_2.Text = "    "
                if isPerm then
                    PlayerName_2.Text = "crasher"
                end
                PlayerName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                PlayerName_2.TextScaled = true
                PlayerName_2.TextSize = 14.000
                PlayerName_2.TextWrapped = true
                PlayerName_2.TextXAlignment = Enum.TextXAlignment.Left

                SizeConstraint_2.Name = "SizeConstraint"
                SizeConstraint_2.Parent = PlayerName_2
                SizeConstraint_2.MaxTextSize = 14
                SizeConstraint_2.MinTextSize = 9

                PlayerName_3.Name = "PlayerName"
                PlayerName_3.Parent = NameFrame
                PlayerName_3.BackgroundTransparency = 1.000
                PlayerName_3.LayoutOrder = 3
                PlayerName_3.Size = UDim2.new(1, -34, 1, 0)

                PlayerName_4.Name = "PlayerName"
                PlayerName_4.Parent = PlayerName_3
                PlayerName_4.BackgroundTransparency = 1.000
                PlayerName_4.Position = UDim2.new(0.422413796, 0, 0.280000001, 0)
                PlayerName_4.Size = UDim2.new(1, 0, 0.439999998, 0)
                PlayerName_4.Font = Enum.Font.GothamSemibold
                PlayerName_4.Text = plrName
                PlayerName_4.TextColor3 = Color3.fromRGB(255, 255, 255)
                PlayerName_4.TextScaled = true
                PlayerName_4.TextSize = 14.000
                PlayerName_4.TextWrapped = true
                PlayerName_4.TextXAlignment = Enum.TextXAlignment.Left

                SizeConstraint_3.Name = "SizeConstraint"
                SizeConstraint_3.Parent = PlayerName_4
                SizeConstraint_3.MaxTextSize = 14
                SizeConstraint_3.MinTextSize = 9

                Layout.Name = "Layout"
                Layout.Parent = ChildrenFrame
                Layout.FillDirection = Enum.FillDirection.Horizontal
                Layout.SortOrder = Enum.SortOrder.Name
                Layout.VerticalAlignment = Enum.VerticalAlignment.Center
            end

            game.StarterGui:SetCoreGuiEnabled("PlayerList", false)

            game.Players.ChildRemoved:Connect(function(player)
                    if script.Parent:FindFirstChild(player.Name) then
                        script.Parent:FindFirstChild(player.Name):remove()
                    end
                end)

            while task.wait(1) do
                for _, plr in pairs(game.Players:GetChildren()) do
                    if not script.Parent:FindFirstChild(plr.Name) then
                        addBox(hasGamepass(plr.UserId, 1293677), plr.Name, plr.DisplayName)
                        wait()
                    --script.Parent.Size = UDim2.new(0, 166, 0, (#script.Parent:GetChildren() - 1) * 50)
                    end
                end
            end
        end
        coroutine.wrap(KTJYHGG_fake_script)()
    end
)()

add("shutdown", function()
	getgenv().conga = state
	runCmd(":runc !")
end)

add("warn", function()
    getgenv().conga = state
    runCmd(":runc 1")
end)