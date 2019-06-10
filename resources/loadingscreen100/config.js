/*
    This script was developed by Piter Van Rujpen/TheGamerRespow for Vulkanoa (https://discord.gg/bzMnYPS).
    Do not re-upload this script without my authorization. (I only give authorization by PM on FiveM.net (https://forum.fivem.net/u/TheGamerRespow))
*/

var VK = new Object(); // DO NOT CHANGE
VK.server = new Object(); // DO NOT CHANGE

VK.backgrounds = new Object(); // DO NOT CHANGE
VK.backgrounds.actual = 0; // DO NOT CHANGE
VK.backgrounds.way = true; // DO NOT CHANGE
VK.config = new Object(); // DO NOT CHANGE
VK.tips = new Object(); // DO NOT CHANGE
VK.music = new Object(); // DO NOT CHANGE
VK.info = new Object(); // DO NOT CHANGE
VK.social = new Object(); // DO NOT CHANGE
VK.players = new Object(); // DO NOT CHANGE 

//////////////////////////////// CONFIG

VK.config.loadingSessionText = "Chargement de la session..."; // Loading session text
VK.config.firstColor = [35, 159, 64]; // First color in rgb : [r, g, b]
VK.config.secondColor = [255, 255, 255]; // Second color in rgb : [r, g, b]
VK.config.thirdColor = [218, 0, 0]; // Third color in rgb : [r, g, b]

VK.backgrounds.list = [ // Backgrounds list, can be on local or distant(http://....)
    "img/1.jpg",
    "img/2.jpg",
    "img/3.jpg"
];
VK.backgrounds.duration = 3000; // Background duration (in ms) before transition (the transition lasts 1/3 of this time)

VK.tips.enable = true; //Enable tips (true : enable, false : prevent)
VK.tips.list = [ // Tips list
		"برای قفل کردن و باز کردن ماشین فقط کافیه دکمه U را بزنید",
        "برای فعال کردن سیستم کروز کنترل کافیست دکمه ی B را بزنید",
        "مراقب باشید برای انجام کار های خلاف قانون جریمه نشوید! حداقل جلوی پلیس انجام ندید",
        "برای بستن کمربند دکمه ی L را بزنید",
        "آیا میدونستید میتونید پسزمینه ی گوشیتونو عوض کنید؟",
        "پس زمینه های دیفالت رو میتونید از سایت WALLLIT.ir دانلود کنید.",
        "در صورت داشتن شکایت میتونید به اداره ی پلیس مراجعه کنید",
        "میدونستید میتونید اسلحه بدون مجوز بخرید؟ بین خودمون باشه ها",
        "در صورت داشتن پیشنهاد یا انتقاد خوشحال میشیم با ما در میون بذارید.",
        "میتونید با زدن دکمه های = و - راهنما بزنید",
        "مراقب باشید ماشیناتونو دیگران ندزدن",
        "آیا میدونستید پلیس میتونه شما رو به جرم حتی ایجاد ترافیک جریمه کنه؟",
        "بازی کنید و کیف کنید.",
		"قوانین سرور را در سایت forum.javandata.com بخوانید",
		"برای باز کردن صندوق ماشین alt بزنید",
		"برای تغییر مقدار صداتون تو بازی H بزنید",
		"تیم اسپیک سرور ts.javamdata.com",
		"در صورتی که میخواید پلیری را ریپورت کنید در سایت forum.javandata.com اطلاع دهید"
];

VK.music.url = "music.ogg"; // Music url, can be on local or distant(http://....) ("NONE" to desactive music)
VK.music.volume = 0.2; // Music volume (0-1)
VK.music.title = "Post Malone - Go Flex"; // Music title ("NONE" to desactive)
VK.music.submitedBy = "Music Uploaded by SNIPER"; // Music submited by... ("NONE" to desactive)

VK.info.logo = "icon/logo1.png"; // Logo, can be on local or distant(http://....) ("NONE" to desactive)
VK.info.website = "forum.javandata.com"; // Website url ("NONE" to desactive)
VK.info.text = "ایران لگاسی"; // Bottom right corner text ("NONE" to desactive) 
VK.info.ip = "i dont like to share"; // Your server ip and port ("ip:port")

VK.social.discord = ".gg/5b4Q4rb"; // Discord url ("NONE" to desactive)
VK.social.twitter = "WALLLIT.ir"; // Twitter url ("NONE" to desactive)
VK.social.facebook = "motelqu.com"; // Facebook url ("NONE" to desactive)
VK.social.youtube = "/javandata"; // Youtube url ("NONE" to desactive)
//VK.social.twitch = "/thegamerrespow"; // Twitch url ("NONE" to desactive)

VK.players.enable = true; // Enable the players count of the server (true : enable, false : prevent)
VK.players.multiplePlayersOnline = "@players joueurs en ligne"; // @players equals the players count
VK.players.onePlayerOnline = "1 joueur en ligne"; // Text when only one player is on the server
VK.players.noPlayerOnline = "Aucun joueur en ligne"; // Text when the server is empty

////////////////////////////////
