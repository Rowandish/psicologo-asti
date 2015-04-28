var b = "";var so = "";var lb = "";function LTrim( value ) {
	
	var re = /\s*((\S+\s*)*)/;
	return value.replace(re, "$1");
	
}

function RTrim( value ) {
	
	var re = /((\s*\S+)*)\s*/;
	return value.replace(re, "$1");
	
}

function trim( value ) {
	
	return LTrim(RTrim(value));
	
}

function subtype(str,os_name)
{
	var Res = "";
	switch(os_name)
	{
		   case "windows":
		      Pattern = "win(?:dows)?(?: )?(9x|95|98)";
				if (str.match (new RegExp (Pattern)))
				{
					Res = "9x";				
				}

		        Pattern = "win(?:dows)?(?: )?(?:nt)?(?: )?(?:nt|5\.\d|xp|200\d)";

				if (str.match (new RegExp (Pattern)))
				{
					Res = "NT";				
				}
				 break;
		   case "macintosh": 
		      Res = "";
				 break;
		   case "linux": 
		      Pattern = "(debian|mdk|slack|redhat|gentoo|suse)";
		      if (str.match (new RegExp (Pattern)))
			  {
				 Res = "";
		         Res = Res.replace("debian", "Debian");
		         Res = Res.replace("mdk", "Mandrake");
		         Res = Res.replace("slack", "Slackwave");
		         Res = Res.replace("redhat", "RedHat");
		         Res = Res.replace("gentoo", "Gentoo");
		         Res = Res.replace("suse", "Suse");
		      }
				 break;
		   case "mac": 
		      Res = "OS";
			  if (str.indexOf("mac os x") !=-1)
				 Res = " OS 10";
			 break;
	}
	return Res;
}

function verOS(Pattern,bro_name,str)
{
	var Res = "";
	switch(bro_name)
	{
	   case "":
	      Res = "";
			break;
		case "avantbrowser":
			 Res = "";
			break;
		case "ibrowse":
			 Res = "";
			break;
	   case "mozilla":
	      	Pattern = "()(?:rv:)";					
			fai = new RegExp (Pattern);
			m = fai.exec(str);
 			if (m == null) {
				
				Pattern = "^(mozilla/)";
				fai2 = new RegExp (Pattern);
				m2 = fai2.exec(str);
 				if (m2 != null) {
					str = str.substr(m2.index,str.length);
					if (str.indexOf(";")!='-1')
						str = str.substr(0,str.indexOf(";"));
					Res = str.replace(fai2,"");
					Res = " "+Res.substr(0,3);						
		        }				
			}
			else{			
				str = str.substr(m.index,str.length);
				if (str.indexOf(";")!='-1')
					str = str.substr(0,str.indexOf(";"));
				Res = str.replace(fai,"");
				Res = " "+Res.substr(0,3);
					
			}
			break;
	   case "netscape":
			Pattern = "(netscape/)";			
			fai = new RegExp (Pattern);
			m = fai.exec(str);
 			if (m != null) {				
				str = str.substr(m.index,str.length);
				if (str.indexOf(";")!='-1')
					str = str.substr(0,str.indexOf(";"));
				Res = str.replace(fai,"");
				Res = " "+Res.substr(0,3);	
					
			}
	   		break;
		case "konqueror":
			Pattern = "(konqueror/)";			
			fai = new RegExp (Pattern);
			m = fai.exec(str);
 			if (m != null) {				
				str = str.substr(m.index,str.length);
				if (str.indexOf(";")!='-1')
					str = str.substr(0,str.indexOf(";"));
				Res = str.replace(fai,"");
				Res = " "+Res.substr(0,3);	
					
			}
	   		break;
		case "camino","microsoft internet explorer","opera":
			fai = new RegExp (Pattern);
			m = fai.exec(str);
 			if (m != null) {				
				str = str.substr(m.index,str.length);
				if (str.indexOf(";")!='-1')
					str = str.substr(0,str.indexOf(";"));
				Res = str.replace(fai,"");
				Res = Res = " "+Res.substr(0,4);
					
			}
			break;
		case "crazybrowser":
			fai = new RegExp (Pattern);
			m = fai.exec(str);
 			if (m != null) {				
				str = str.substr(m.index,str.length);
				if (str.indexOf(";")!='-1')
					str = str.substr(0,str.indexOf(";"));
				else if (str.indexOf(")")!='-1')
					str = str.substr(0,str.indexOf(")"));
				Res = str.replace(fai,"");
				if (Res.indexOf(".")!='-1')
				{
					list = Res.split(".");
					Res = " "+list[0]+"."+list[1].substr(0,1);
				}
					
			}
			break;

		default:
			fai = new RegExp (Pattern);
			m = fai.exec(str);
 			if (m != null) {				
				str = str.substr(m.index,str.length);
				if (str.indexOf(";")!='-1')
					str = str.substr(0,str.indexOf(";"));
				else if (str.indexOf(" ")!='-1')
					str = str.substr(0,str.indexOf(" "));
				Res = str.replace(fai,"");
				if (str.indexOf(".")!='-1')
				{
					list = Res.split(".");
					Res = " "+list[0]+"."+list[1].substr(0,1);
				}
					
			}
		break;
			
	}
	Res = Res.replace("/"," ");
	Res = Res.replace("(","");
	Res = Res.replace(")","");
	return trim(Res);
}

var agt=navigator.userAgent.toLowerCase();
var appVer = navigator.appVersion.toLowerCase();
var appname = navigator.appName.toLowerCase();

b = "(unknown)";
so = "(unknown)";

 // *** BROWSER VERSION ***
	if (agt!="")
	{
		var l_b = new Array(); 
		var l_ex = new Array();	
		l_b.push("4anything");
		l_ex.push("(4anything)");
		l_b.push("Abacho.com");
		l_ex.push("(abachobot)");
		l_b.push("ABCdatos");
		l_ex.push("(botlink)");
		l_b.push("Alexa.com");
		l_ex.push("(ia_archiver)");
		l_b.push("Alltheweb");
		l_ex.push("(alltheweb)");
		l_b.push("Almaden");
		l_ex.push("(almaden)");
		l_b.push("Altavista");
		l_ex.push("(altavista|scooter|mercator)");
		l_b.push("Anzwers");
		l_ex.push("(anzwers)");
		l_b.push("Ask Jeeves");
		l_ex.push("(ask(?:-|[ ])?jeeves(?:\/teoma)?)");
		l_b.push("Atomz");
		l_ex.push("(atomz)");
		l_b.push("BaiDu");
		l_ex.push("(baiduspider)");
		l_b.push("Batsch");
		l_ex.push("(batsch)");
		l_b.push("DeepIndex");
		l_ex.push("(deep(?:[ ]|-)?index)");
		l_b.push("Dir.com");
		l_ex.push("(pompos)");
		l_b.push("Echo.fr");
		l_ex.push("(echo[!])");
		l_b.push("Entireweb");
		l_ex.push("(speedy(?:[ ]|-)spider)");
		l_b.push("EntireWeb.com");
		l_ex.push("(entireweb)");
		l_b.push("Eule");
		l_ex.push("(eule(?:[ ]|-)?(?:robot)?)");
		l_b.push("Euroseek");
		l_ex.push("(euroseek|arachnoidea)");
		l_b.push("Exactseek");
		l_ex.push("(e(?:xact)?seek(?:[ ]|-)?crawler)");
		l_b.push("Exalead");
		l_ex.push("(exabot)");
		l_b.push("Excalibur");
		l_ex.push("(excalibur(?:[ ]|-)?(?:internet)?(?:[ ]|-)?(?:spider)?(?:[ ]|-)?(?:v)?)");
		l_b.push("Excite");
		l_ex.push("(excite|architextspider)");
		l_b.push("FAST");
		l_ex.push("(fast(?:[ ]|-)?webcrawler)");
		l_b.push("FirstGov.gov");
		l_ex.push("(firstgov\.gov)");
		l_b.push("Galaxy");
		l_ex.push("(galaxy(?:[ ]|-|[.])?(?:bot|com))");
		l_b.push("Gigablast");
		l_ex.push("(gigabot)");
		l_b.push("Google");
		l_ex.push("(google|backrub)");
		l_b.push("Il Trovatore");
		l_ex.push("(il(?:-|[ ])?trovatore)");
		l_b.push("Infoseek");
		l_ex.push("((?:infoseek|ultraseek|marvin)(?:-|[ ])?(?:sidewinder)?)");
		l_b.push("InfoSniff");
		l_ex.push("(infosniff(?:[ ]|-)?(?:sniffer)?)");
		l_b.push("Inktomi");
		l_ex.push("(slurp(?:[.]so)?|inktomi)");
		l_b.push("KolibriOnline");
		l_ex.push("(kolibri)");
		l_b.push("Lexibot");
		l_ex.push("(lexi(?:[ ]|-)?bot|mata(?:[ ]|-)?hari)");
		l_b.push("Looksmart");
		l_ex.push("(zyborg|wisenut|grub(?:-|[ ])?(?:client)?(?:-|[ ])?|zeal|looklisting|looksmart|mantraagent)");
		l_b.push("Lycos");
		l_ex.push("(lycos|wisewire)");
		l_b.push("Microsoft MSN");
		l_ex.push("(msie(?:[ ]|-)?crawler|msn(?:bot)?)");
		l_b.push("National Directory");
		l_ex.push("(nationaldirectory-(?:super|web)spider)");
		l_b.push("Navigation Zone");
		l_ex.push("(nzbot)");
		l_b.push("NetMind");
		l_ex.push("(netmind(?:[ ]|-)?(?:minder)?)");
		l_b.push("NetMind-Minder");
		l_ex.push("(netmind(?:[ ]|-)?minder)");
		l_b.push("Northernlight");
		l_ex.push("(gulliver)");
		l_b.push("Nutch");
		l_ex.push("(nutch(?:[ ]|-|[.])?(?:org|crawler)?)");
		l_b.push("Openfind");
		l_ex.push("(openbot)");
		l_b.push("PicoSearch");
		l_ex.push("(pico(?:[ ]|-)?search)");
		l_b.push("Scrub the Web");
		l_ex.push("(scrubby)");
		l_b.push("Search Engine 2000");
		l_ex.push("(searchengine2000\.com)");
		l_b.push("SearchALot.com");
		l_ex.push("(searchalot)");
		l_b.push("SearchEngineWorld.com");
		l_ex.push("(search(?:[ ]|-)?engine(?:[ ]|-)?world)");
		l_b.push("SearchHippo");
		l_ex.push("(fluffy(?:[ ]|-)?the(?:[ ]|-)?spider)");
		l_b.push("Searchspider");
		l_ex.push("(searchspider)");
		l_b.push("Seed");
		l_ex.push("(gais(?:[ ]|-)?robot)");
		l_b.push("Slider");
		l_ex.push("(slider(?:[ ]|-|[_])?(?:search)?(?:[ ]|-|[_])?(?:v)?)");
		l_b.push("Slysearch");
		l_ex.push("(slysearch)");
		l_b.push("SureSeeker.com");
		l_ex.push("(sureseeker\.com)");
		l_b.push("Surfsafely.com");
		l_ex.push("(surfsafely)");
		l_b.push("SwissSearch");
		l_ex.push("(swisssearch|search\.ch)");
		l_b.push("Szukacz");
		l_ex.push("(szukacz)");
		l_b.push("Teoma");
		l_ex.push("(teoma(?:[ ]|-)?(?:agent)?)");
		l_b.push("Thunderstone");
		l_ex.push("(t-h-u-n-d-e-r-s-t-o-n-e)");
		l_b.push("TurnIt");
		l_ex.push("(turnit(?:[ ]|-)?(?:bot)?)");
		l_b.push("UbiCrawler");
		l_ex.push("(ubicrawler)");
		l_b.push("W8.Net");
		l_ex.push("(w8\.net)");
		l_b.push("Walhello");
		l_ex.push("(appie)");
		l_b.push("Wanadoo");
		l_ex.push("(wanadoo)");
		l_b.push("WebFilter");
		l_ex.push("(web(?:[ ]|-)?filter(?:[ ]|-)?robot)");
		l_b.push("Web-Find.com");
		l_ex.push("(webfindbot)");
		l_b.push("WhatUSeek");
		l_ex.push("(winona)");
		l_b.push("WhizBang");
		l_ex.push("(whizbang|inxight)");
		l_b.push("Willow Internet Crawlers");
		l_ex.push("((?:willow|twotrees)(?:[ ]|-)?(?:v)?)");
		l_b.push("Yahoo");
		l_ex.push("(yahoo)");
		l_b.push("Yandex");
		l_ex.push("(yandex)");
		l_b.push("Yuntis");
		l_ex.push("(gulper)");
		l_b.push("BMC Link Validator");
		l_ex.push("(bmc(?:[ ]|-)?link(?:[ ]|-)?validator)");
		l_b.push("Checkbot");
		l_ex.push("(check(?:[ ]|-)?bot)");
		l_b.push("Cyberspyder");
		l_ex.push("(http(?:[ ]|-)?test(?:[ ]|-)?program|cyberspyder)");
		l_b.push("JCheckLinks");
		l_ex.push("(jchecklinks)");
		l_b.push("Linkbot");
		l_ex.push("(link(?:[ ]|-)?bot)");
		l_b.push("LinkSweeper");
		l_ex.push("(link(?:[ ]|-)?sweeper)");
		l_b.push("LinkWalker");
		l_ex.push("(link(?:[ ]|-)?walker)");
		l_b.push("LinkWalker");
		l_ex.push("(linkwalker)");
		l_b.push("MetaGer");
		l_ex.push("(meta(?:[ ]|-)?ger(?:[ ]|-)?link(?:[ ]|-)?checker)");
		l_b.push("Powermarks");
		l_ex.push("(powermarks)");
		l_b.push("UrlCheck");
		l_ex.push("(url(?:[ ]|-)?check)");
		l_b.push("W3C CSS Validator");
		l_ex.push("(jigsaw|w3c(?:[ ]|-|[_])?css(?:[ ]|-|[_])?(?:validator)?)");
		l_b.push("W3C Line Mode");
		l_ex.push("(w3c(?:[ ]|-|[_])?line(?:[ ]|-|[_])?mode)");
		l_b.push("W3C Validator");
		l_ex.push("(w3c(?:[ ]|-|[_])?(?:validator|checklink)?)");
		l_b.push("Xenu Link Sleuth");
		l_ex.push("(xenu(?:[ ]|-)?(?:link)?(?:[ ]|-)?(?:sleuth)?)");
		l_b.push("K2pdf");
		l_ex.push("(k2pdf)");
		l_b.push("SiteSnagger");
		l_ex.push("(site(?:[ ]|-)?snagger)");
		l_b.push("WGet");
		l_ex.push("(wget)");
		l_b.push("Wysigot");
		l_ex.push("(wysigot)");
		l_b.push("Curl");
		l_ex.push("((?:[^y]|^)curl)");
		l_b.push("GetRight");
		l_ex.push("(getright)");
		l_b.push("Go!zilla");
		l_ex.push("(go(?:\!)?zilla)");
		l_b.push("Pycurl");
		l_ex.push("(pycurl)");
		l_b.push("WebZIP");
		l_ex.push("(web(?:[ ]|-)?zip)");
		l_b.push("1ClickWebSlideShow");
		l_ex.push("((?:1|one)clickwebslideshow)");
		l_b.push("Ad Muncher");
		l_ex.push("(ad(?:[ ]|-)?muncher)");
		l_b.push("Anonymizer");
		l_ex.push("(turing(?:[ ]|-)?(?:os|machine)?)");
		l_b.push("FavOrg");
		l_ex.push("(fav(?:[ ]|-|[.])?org)");
		l_b.push("i-MailBook");
		l_ex.push("(i(?:-)?mailbook)");
		l_b.push("iOpus Internet Monitoring");
		l_ex.push("(iopus(?:-I-M)?)");
		l_b.push("Keyword Density");
		l_ex.push("(keyword(?:[ ]|-)?density)");
		l_b.push("LinksManager.com");
		l_ex.push("(linksmanager\.com)");
		l_b.push("Sam Spade");
		l_ex.push("(sam(?:[ ]|-)?spade)");
		l_b.push("URLMenu98");
		l_ex.push("(url(?:[ ]|-)?menu98)");
		l_b.push("WebTrends Link Analyzer");
		l_ex.push("(web(?:[ ]|-)?trends)");
		l_b.push("Robot");
		l_ex.push("(spider|crawl|bot$)");
		l_b.push("Opera");
		l_ex.push("(opera)");
		l_b.push("Sega Console");
		l_ex.push("(dreamcast|planetweb|sega)");
		l_b.push("Xbox");
		l_ex.push("(xbox)");
		l_b.push("Amaya");
		l_ex.push("(amaya)");
		l_b.push("AmigaVoyager");
		l_ex.push("(amigavoyager)");
		l_b.push("AOL Browser");
		l_ex.push("(aol(?:-|[ ])?(?:browser|iweng)?)");
		l_b.push("Arachmo");
		l_ex.push("(arachmo)");
		l_b.push("Arachne");
		l_ex.push("(arachne)");
		l_b.push("Arexx");
		l_ex.push("(arexx)");
		l_b.push("AvantBrowser");
		l_ex.push("(avant(?:-|[ ])?browser)");
		l_b.push("Aweb");
		l_ex.push("((?:amiga(?:-|[ ])?)?aweb(?:[(].+[)])?)");
		l_b.push("BackStreet");
		l_ex.push("(backstreet)");
		l_b.push("Beonex");
		l_ex.push("(beonex)");
		l_b.push("Blazer");
		l_ex.push("(blazer)");
		l_b.push("Camino");
		l_ex.push("(cerberian(?:-|[ ])?drtrs)");
		l_b.push("Camino");
		l_ex.push("(camino)");
		l_b.push("Chimera");
		l_ex.push("(chimera)");
		l_b.push("Coldfusion");
		l_ex.push("(cold(?:-|[ ])?fusion)");
		l_b.push("Contiki");
		l_ex.push("(contiki)");
		l_b.push("CrazyBrowser");
		l_ex.push("(crazy(?:-|[ ])?browser)");
		l_b.push("Cuam");
		l_ex.push("(cuam(?:(?:-|[ ])?ver)?)");
		l_b.push("CyberDog");
		l_ex.push("(cyber(?:-|[ ])?dog)");
		l_b.push("Dillo");
		l_ex.push("(dillo)");
		l_b.push("DocZilla");
		l_ex.push("(doczilla)");
		l_b.push("Emacs/W3");
		l_ex.push("(emacs(?:-|[ ]|\/)?w3)");
		l_b.push("Enigma");
		l_ex.push("(enigma)");
		l_b.push("Epsilon");
		l_ex.push("(epsilon)");
		l_b.push("EZW");
		l_ex.push("(ezw)");
		l_b.push("Firebird");
		l_ex.push("(firebird(?:(?:-|[ ])?browser)?)");
		l_b.push("Firefox");
		l_ex.push("(firefox(?:(?:-|[ ])?browser)?)");
		l_b.push("FrontPage");
		l_ex.push("((?:ms)?(?:-|[ ])?frontpage(?:-|[ ])?(?:express)?)");
		l_b.push("Galeon");
		l_ex.push("(galeon)");
		l_b.push("HotJava");
		l_ex.push("(hot(?:-|[ ])?java)");
		l_b.push("IBM WebExplorer");
		l_ex.push("((?:ibm)?(?:-|[ ])?web(?:-|[ ])?explorer)");
		l_b.push("iBrowse");
		l_ex.push("(ibrowse)");
		l_b.push("iCab");
		l_ex.push("(icab)");
		l_b.push("I-Opener");
		l_ex.push("(i(?:-|[ ])?opener|netpliance)");
		l_b.push("JAVA");
		l_ex.push("(java)");
		l_b.push("K-Meleon");
		l_ex.push("(k(?:-|[ ])?meleon)");
		l_b.push("Konqueror");
		l_ex.push("(konq)");
		l_b.push("Lachesis");
		l_ex.push("(lachesis)");
		l_b.push("Liberate TV");
		l_ex.push("(liberate(?:-|[ ])?(?:dtv)?)'");
		l_b.push("Lotus Notes");
		l_ex.push("(lotus(?:-|[ ])?notes)");
		l_b.push("Lycoris Desktop/LX");
		l_ex.push("(lycoris|desktop\/lx)");
		l_b.push("Lynx");
		l_ex.push("(lynx)");
		l_b.push("Megite");
		l_ex.push("(megite)");
		l_b.push("Mosaic");
		l_ex.push("((?:ncsa)?(?:-|[ ])?mosaic(?:[ ]for[ ]amiga)?)");
		l_b.push("MSN Explorer");
		l_ex.push("(msn(?:-|[ ])?(?:explorer)?)");
		l_b.push("MultiZilla");
		l_ex.push("(multizilla(?:-|[ ]|\/)?(?:v)?)");
		l_b.push("MyIE2");
		l_ex.push("(myie(?:-|[ ])?2)");
		l_b.push("Nautilus");
		l_ex.push("(nautilus)");
		l_b.push("NCBrowser");
		l_ex.push("(ncbrowser)");
		l_b.push("Neoplanet");
		l_ex.push("(neoplanet(?:2)?)");
		l_b.push("NetCaptor");
		l_ex.push("(netcaptor)");
		l_b.push("NetPositive");
		l_ex.push("(netpositive|zonesurf)");
		l_b.push("Nutscrape");
		l_ex.push("(nutscrape)");
		l_b.push("OffByOne");
		l_ex.push("(offbyone)");
		l_b.push("OmniWeb");
		l_ex.push("(omniweb)");
		l_b.push("Phaseout");
		l_ex.push("(phaseout)");
		l_b.push("Phoenix");
		l_ex.push("(phoenix)");
		l_b.push("Planetweb");
		l_ex.push("(planetweb)");
		l_b.push("Pocket Internet Explorer");
		l_ex.push("(pocket(?:-|[ ])?internet(?:-|[ ])?explorer|mspie)");
		l_b.push("PowerTV");
		l_ex.push("(power(?:-|[ ])?tv)");
		l_b.push("Prodigy Web Browser");
		l_ex.push("(prodigy(?:-|[ ])?(?:web(?:-|[ ])?browser|wb)?)");
		l_b.push("QNX Voyager");
		l_ex.push("(qnx(?:-|[ ])?voyager)");
		l_b.push("Chrome");
		l_ex.push("(chrome)");		
		l_b.push("Safari");
		l_ex.push("(safari|applewebkit)");		
		l_b.push("Safe Explorer");
		l_ex.push("(safeexploerer)");
		l_b.push("SmartExplorer");
		l_ex.push("(smart(?:-|[ ])?explorer)");
		l_b.push("sUbrowser");
		l_ex.push("(subrowser(?:_|-|[ ])?)");
		l_b.push("Tango");
		l_ex.push("(tango|sextant)");
		l_b.push("TeaCup");
		l_ex.push("(tea(?:-|[ ])?cup)");
		l_b.push("TurboBrowser");
		l_ex.push("(turbo(?:-|[ ])?browser)");
		l_b.push("WebCapture");
		l_ex.push("(web(?:-|[ ])?capture)");
		l_b.push("WEBCapture");
		l_ex.push("(web(?:-|[ ])?capture)");
		l_b.push("WEBCopier");
		l_ex.push("(web(?:-|[ ])?copier)");
		l_b.push("WebDownloader");
		l_ex.push("(web(?:-|[ ])?downloader)");
		l_b.push("WEBStripper");
		l_ex.push("(web(?:-|[ ])?stripper)");
		l_b.push("WEBTv");
		l_ex.push("(web(?:-|[ ])?tv)");
		l_b.push("WebWasher");
		l_ex.push("(web(?:-|[ ])?washer)");
		l_b.push("Yoda");
		l_ex.push("(yoda)");
		l_b.push("Alpha");
		l_ex.push("(alpha)");
		l_b.push("Microsoft Internet Explorer");
		l_ex.push("(msie|internet(?:-|[ ])?explorer)");
		l_b.push("Netscape");
		l_ex.push("(netscape(?:6)?)");
		l_b.push("Netgem");
		l_ex.push("(netgem)");
		l_b.push("Winamp");
		l_ex.push("(winamp)");
		l_b.push("Microsoft NetShow");
		l_ex.push("(netshow)'");
		l_b.push("Microsoft Windows Media Player");
		l_ex.push("((?:windows)?(?:-|[ ])?media(?:-|[ ])?player|nsplayer)");
		l_b.push("Quicktime");
		l_ex.push("(quicktime|qtver)");
		l_b.push("AKAV");
		l_ex.push("(alav(?:-|[ ])?(?:up)?)");
		l_b.push("AvantGo");
		l_ex.push("(avant(?:-|[ ])?go)");
		l_b.push("ccWAP-Browser");
		l_ex.push("(ccwap(?:-|[ ])?browser)");
		l_b.push("Conduits");
		l_ex.push("(conduits(?:-|[ ])?(?:palmbrowser)?)");
		l_b.push("Doris");
		l_ex.push("(doris)");
		l_b.push("Elaine");
		l_ex.push("(elaine)");
		l_b.push("EzWAPBrowser");
		l_ex.push("(ezwapbrowser)");
		l_b.push("Fetchpage");
		l_ex.push("(fetchpage(?:\.cgi)?)");
		l_b.push("Google WAP");
		l_ex.push("(google(?:-|[ ])?wap(?:-|[ ])?(?:proxy)?)");
		l_b.push("iBrowser");
		l_ex.push("(ibrowser)");
		l_b.push("iPanel");
		l_ex.push("(ipanel)");
		l_b.push("iSiloX");
		l_ex.push("(isilox)");
		l_b.push("KBrowser");
		l_ex.push("(kbrowser)");
		l_b.push("Klondike");
		l_ex.push("(klondike)");
		l_b.push("Materna");
		l_ex.push("(materna(?:-|[ ])?wappreview)");
		l_b.push("Mitsu");
		l_ex.push("(mitsu)");
		l_b.push("Palm Wapper");
		l_ex.push("((?:aur)?(?:-|[ ])?palm(?:-|[ ])?wapper)");
		l_b.push("ReqwirelessWeb");
		l_ex.push("(reqwirelessweb)");
		l_b.push("UP.Browser");
		l_ex.push("(up\.browser)");
		l_b.push("Wapalizer");
		l_ex.push("(wapalizer)");
		l_b.push("WapBrowser");
		l_ex.push("(wapbrowser)");
		l_b.push("WapIDE-SDK");
		l_ex.push("(wapide(?:-|[ ])?sdk)");
		l_b.push("WAPJAG Virtual");
		l_ex.push("(wapjag(?:-|[ ])?virtual(?:-|[ ])?wap)");
		l_b.push("WAPman");
		l_ex.push("(wapman)");
		l_b.push("Wapper");
		l_ex.push("(wapper)");
		l_b.push("Waptor");
		l_ex.push("(waptor)");
		l_b.push("Wapview");
		l_ex.push("(wapview)");
		l_b.push("WinWap");
		l_ex.push("(winwap)");
		l_b.push("YourWap.com");
		l_ex.push("(yourwap)");
		l_b.push("Zetor");
		l_ex.push("(zetor)");

		pPattern = "";
		for (i = 0; i<l_b.length; i++)
		{
			re = new RegExp (l_ex[i]);
			m = re.exec(agt);
 			if (m != null) {				
				b = l_b[i];
				pPattern =l_ex[i];
				i=l_b.length+100;					
			}
	
		}
		
		if(b=="(unknown)")
		{
			Pattern = "mozilla";
			re = new RegExp (Pattern);
			m = re.exec(agt);
	 		if (m != null) { 				
			   Pattern = "netscape";
		 		if (!agt.match (new RegExp (Pattern))) { 
			      b = "Mozilla";
				}
			    else
				{
			      b = "Netscape";
			    }				
			}
			
		}	
			
		if (b.toLowerCase() =="microsoft internet explorer 7.0")
			nnb = 3;
		else if (b.toLowerCase()=="microsoft internet explorer 6.0")
			nnb = 2;
		else if (b.toLowerCase()=="avantbrowser")
			nnb = 4;
		else if (b.toLowerCase() =="firefox")
			nnb = 1;
		else
			nnb = 0;
		

		ver_browser = verOS(pPattern,b.toLowerCase(),agt);
		if (trim(ver_browser)!='' && b!="(unknown)")
		{
			// elimino "toolbar...."
			tool = "toolbar";
			tt= ver_browser.indexOf(tool);
			if (tt!='-1')
				ver_browser = tool; 

			// elimino "khtml, like gecko safari..... "
			tool = "khtml, like gecko";
			tt= ver_browser.indexOf(tool);
			if (tt!='-1')
				ver_browser = ver_browser.substr(0,tt);	


			b = trim(b) + " " + trim(ver_browser);
		}	
		else if (trim(ver_browser)!='')
		{
			b = trim(ver_browser);
		}

		if (b.toLowerCase() =="microsoft internet explorer 7.0")
			nnb = 3;
		else if (b.toLowerCase()=="microsoft internet explorer 6.0")
			nnb = 2;
		else if (b.toLowerCase()=="avantbrowser")
			nnb = 4;
		else if (b.toLowerCase() =="firefox")
			nnb = 1;
	

		
	}

// *** PLATFORM ***
	var lw = new Array(); 
	var s_w = new Array(); 
	var t_w = new Array(); 
	var i = 0;


	if(agt.match (new RegExp ("(win)")))
	{		
		
		lw[0] = "Microsoft Windows VISTA";
		t_w[0] = 'NT';
		s_w[0] = "win(?:dows)?(?: )?(?:nt(?: )?6\.0)";

		lw[1] = "Microsoft Windows 2003";
		t_w[1] = 'NT';
		s_w[1] = "win(?:dows)?(?: )?(?:(?:server(?: )?)?2003|nt(?: )?5\.2)";

		lw[2] = "Microsoft Windows XP";
		t_w[2] = 'NT';
		s_w[2] = "win(?:dows)?(?: )?(?:nt(?: )?5\.1|xp)";

		lw[3] = "Microsoft Windows 2000";
		t_w[3] = 'NT';
		s_w[3] = "win(?:dows)?(?: )?(?:(?:2000|2k)|nt(?: )?5\.0)";

		lw[4] = "Microsoft Windows ME";
		t_w[4] = '9x';
		s_w[4] = "win(?:dows)?(?: )?(?:9x 4\.9|me)";

		lw[5] = "Microsoft Windows 98";
		t_w[5] = '9x';
		s_w[5] = "win(?:dows)?(?: )?98";		
		

		lw[6] = "Microsoft Windows 95";
		t_w[6] = '9x';
		s_w[6] = "win(?:dows)?(?: )?95";

		lw[7] = "Microsoft Windows 95";
		t_w[7] = '9x';
		s_w[7] = "win(?:dows)?(?: )?9x";

		lw[8] = "Microsoft Windows 95";
		t_w[8] = '9x';
		s_w[8] = "win(?:dows)?(?: )?32";

		lw[9] = "Microsoft Windows 95";
		t_w[9] = '9x';
		s_w[9] = "win(?:dows)?(?: )?95\/nt4";		
		
		lw[10] = "Microsoft Windows 7";
		t_w[10] = 'NT';
		s_w[10] = "win(?:dows)?(?: )?(?:nt(?: )?6\.1)";

		lw[11] = "Microsoft Windows NT 3.11";
		t_w[11] = 'NT';
		s_w[11] = "win(?:dows)?(?: )?nt(?: )?3";

		lw[12] = "Microsoft Windows NT 4";
		t_w[12] = 'NT';
		s_w[12] = "win(?:dows)?(?: )?nt";

		lw[13] = "Microsoft Windows 3.1";
		t_w[13] = '9x';
		s_w[13] = "win(?:dows)?(?: )?(?:3\.1|16)";

		lw[14] = "Microsoft Windows CE";
		t_w[14] = 'CE';
		s_w[14] = "win(?:dows)?(?: )?ce";


		tipo1 = "win(?:dows)?(?: )?(9x|95|98)"
		if (agt.match (new RegExp (tipo1)))	
			Res = "9x"

	     tipo2 = "win(?:dows)?(?: )?(?:nt)?(?: )?(?:nt|5\.\d|xp|200\d)"
     	if (agt.match (new RegExp (tipo1)))	
			Res = "NT"

		for (i = 0; i<lw.length; i++)
		{	
			if (agt.match (new RegExp (s_w[i])))
			{
				so = lw[i];
				i = lw.length +100;			
			}	
		}
		
	}
	else	
	{  
		lw[0] = "Commodore";
			s_w[0] = "(commodore)";
		lw[1] = "BeOS";
			s_w[1] = "(beos)";
		lw[2] = "Mac";
			s_w[2] = "(mac(?: )?os|p(?:ower)?pc)";
		lw[3] = "Macintosh";
			s_w[3] = "(mac|apple)";		
		lw[4] = "Linux";
			s_w[4] = "(linux)";
		lw[5] = "Sun OS";
			s_w[5] = "(sun(?:-|[ ])?(?:os)?)";
		lw[6] = "OS/2";
			s_w[6] = "(os(?: )?(?:\/)?(?: )?2)";
		lw[7] = "RiscOS";
			s_w[7] = "(risc(?:-|[ ])?os)";
		lw[8] = "Amiga";
			s_w[8] = "(amiga(?:-|[ ])?(?:os)?)";
		lw[9] = "Atari";
			s_w[9] = "(atari)";
		lw[10] = "DOS";
			s_w[10] = "(dos)";
		lw[11] = "Nokia Mobile";
			s_w[11] = "(nokia(?:-|[ ])?(?:\w*))";
		lw[12] = "SonyEricsson Mobile";
			s_w[12] = "(sony(?:-|[ ]|\/)?(?:ericsson)?(?:-|[ ])?(?:\w*))";
		lw[13] = "Motorola Mobile";
			s_w[13] = "(mot(?:orola)?)";
		lw[14] = "Alcatel Mobile";
			s_w[14] = "(alcatel)";
		lw[15] = "Panasonic Mobile";
			s_w[15] = "(panasonic)";
		lw[16] = "Philips Palm";
			s_w[16] = "(philips)";
		lw[17] = "Psion Palm";
			s_w[17] = "(psion)";
		lw[18] = "Sega Console";
			s_w[18] = "(dreamcast|sega)";
		lw[19] = "FreeBSD";
			s_w[19] = "(free(?:-|[ ])?bsd)";
		lw[20] = "OpenBSD";
			s_w[20] = "(open(?:-|[ ])?bsd)";
		lw[21] = "NetBSD";
			s_w[21] = "(net(?:-|[ ])?bsd)";
		lw[22] = "BSD";
			s_w[22] = "(bsd)";
		lw[23] = "GNU Hurd";
			s_w[23] = "(gnu(?:-|[ ])?hurd)";
		lw[24] = "IRIX";
			s_w[24] = "(irix)";
		lw[25] = "HP-UX";
			s_w[25] = "(hp(?:-|[ ])?ux)";
		lw[26] = "SCO";
			s_w[26] = "(sco|unix_sv)";
		lw[27] = "AIX";
			s_w[27] = "(aix)";
		lw[28] = "Reliant";
			s_w[28] = "(reliant)";
		lw[29] = "DEC";
			s_w[29] = "(dec|ultrix|osf1)";
		lw[30] = "Sinix";
			s_w[30] = "(sinix)";
		lw[31] = "VMS";
			s_w[31] = "(vms|vax)";
		lw[32] = "UnixWare";
			s_w[32] = "(unixware|unix_system_v)";
		lw[33] = "Mpras";
			s_w[33] = "(mpras|ncr)";
		lw[34] = "Symbian";
			s_w[34] = "(symbian)";
		lw[35] = "UNIX";
			s_w[35] = "(unix|x11)";
		lw[36] = "Windows";
			s_w[36] = "(win)";
		lw[37] = "Ubuntu";
			s_w[37] = "(ubuntu(?: )?(?:\/))";


		for (i = 0; i<lw.length; i++)
		{
			tipo_win = lw[i].toLowerCase();
						
			if (agt.match (new RegExp (s_w[i])))
			{	so = lw[i];
				i=lw.length+100;					
			}

			
		}
		res = subtype(agt,so.toLowerCase());
		// 	so = so + " "+ res;
		if(trim(res)!="")
			so = trim(so) +" "+ trim(res);
	}
	var file='http://count.vivistats.com/count.asp?CountId=30269';f='' + escape(document.referrer);u='' + escape(document.URL); var w=screen.width; var h=screen.height; v=navigator.appName; if (v != 'Netscape') {c=screen.colorDepth;}else {c=screen.pixelDepth;}var fs = window.screen.fontSmoothingEnabled;lb = 'it';j=navigator.javaEnabled();info='w=' + w + '&h=' + h + '&c=' + c + '&r=' + f + '&u='+ u + '&fs=' + fs + '&j=' + j + '&lb=' + lb + '&so=' + so+ '&b=' + b ;document.write('<a href="http://it.vivistats.com/all_stats.asp?az=view_stats&config_id=30269" target="_blank">');document.write('<img src="' + file + '&'+info+ '&rando=0.7055475" border="0">');document.write('</a>');document.write ('<!-- qui -->');