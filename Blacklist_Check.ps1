


#---------------------------------------------------------------------------------------#
#########################################################################################
#---------------------------------------------------------------------------------------#


### Script by Pascal Baumgartner - Made in Switzerland ###

### Feel Free to us the Script ###


#---------------------------------------------------------------------------------------#
#########################################################################################
#---------------------------------------------------------------------------------------#






#########################################################################################
#
# Create Log File
#
#########################################################################################


$path = ".\"
$date = get-date -format "yyyy-MM-dd-HH-mm"
$file = ("Log_" + $date + ".log")
$logfile = $path + "\" + $file

function Write-Log([string]$logtext, [int]$level=0)
{
	$logdate = get-date -format "yyyy-MM-dd HH:mm:ss"
	if($level -eq 0)
	{
		$logtext = "[INFO] " + $logtext
		$text = "["+$logdate+"] - " + $logtext
		Write-Host $text
	}
	if($level -eq 1)
	{
		$logtext = "[WARNING] " + $logtext
		$text = "["+$logdate+"] - " + $logtext
		Write-Host $text -ForegroundColor Yellow
	}
	if($level -eq 2)
	{
		$logtext = "[ERROR] " + $logtext
		$text = "["+$logdate+"] - " + $logtext
		Write-Host $text -ForegroundColor Red
	}
	$text >> $logfile
}


# use more than simple variables in a string
$cmds = get-command
Write-Log "there are $($cmds.count) commands available"



#########################################################################################
#
# Log End
#
#########################################################################################





###





clear
$ResultTextForEmailString = ""




#########################################################################################
#
# Check Blacklist Part
#
#########################################################################################



$ResultTextForEmailString = "${ResultTextForEmailString}<h1>Blacklist</h1> `r`n"


$IP = @('8.8.8.8') #Change the IP to your Email Servers IP
$blacklistServers = @(
	'all.s5h.net'
	'b.barracudacentral.org'
	'bl.spamcop.net'
	'blacklist.woody.ch'
	'bogons.cymru.com'
	'cbl.abuseat.org'
	'combined.abuse.ch'
	'db.wpbl.info'
	'dnsbl-1.uceprotect.net'
	'dnsbl-2.uceprotect.net'
	'dnsbl-3.uceprotect.net'	
	'dnsbl.dronebl.org'
	'dnsbl.sorbs.net'	
	'drone.abuse.ch'
	'duinv.aupads.org'
	'dul.dnsbl.sorbs.net'	
	'dyna.spamrats.com'
	'http.dnsbl.sorbs.net'
	'ips.backscatterer.org'	
	'ix.dnsbl.manitu.net'
	'korea.services.net'
	'misc.dnsbl.sorbs.net'
	'noptr.spamrats.com'
	'orvedb.aupads.org'
	'pbl.spamhaus.org'
	'proxy.bl.gweep.ca'	
	'psbl.surriel.com'
	'relays.bl.gweep.ca'	
	'relays.nether.net'
	'sbl.spamhaus.org'
	'singular.ttk.pte.hu'	
	'smtp.dnsbl.sorbs.net'	
	'socks.dnsbl.sorbs.net'
	'spam.abuse.ch'	
	'spam.dnsbl.anonmails.de'
	'spam.dnsbl.sorbs.net'
	'spam.spamrats.com'	
	'spambot.bls.digibase.ca'	
	'spamrbl.imp.ch'
	'spamsources.fabel.dk'	
	'ubl.lashback.com'
	'ubl.unsubscore.com'
	'virus.rbl.jp'	
	'web.dnsbl.sorbs.net'	
	'wormrbl.imp.ch'
	'xbl.spamhaus.org'	
	'z.mailspike.net'	
	'zen.spamhaus.org'
	'zombie.dnsbl.sorbs.net'
	'0spam.fusionzero.com'
    'b.barracudacentral.org'
    'spam.rbl.msrbl.net'
    'zen.spamhaus.org'
    'bl.deadbeef.com'
    'bl.spamcop.net'
    'blackholes.five-ten-sg.com'
    'blacklist.woody.ch'
    'bogons.cymru.com'
    'cbl.abuseat.org'
    'cdl.anti-spam.org.cn'
    'combined.abuse.ch'
    'combined.rbl.msrbl.net'
    'db.wpbl.info'
    'dnsbl-1.uceprotect.net'
    'dnsbl-2.uceprotect.net'
    'dnsbl-3.uceprotect.net'
    'dnsbl.cyberlogic.net'
    'dnsbl.inps.de'
    'dnsbl.njabl.org'
    'dnsbl.sorbs.net'
    'drone.abuse.ch'
    'drone.abuse.ch'
    'duinv.aupads.org'
    'dul.dnsbl.sorbs.net'
    'dul.ru'
    'dyna.spamrats.com'
    'dynip.rothen.com'
    'http.dnsbl.sorbs.net'
    'images.rbl.msrbl.net'
    'ips.backscatterer.org'
    'ix.dnsbl.manitu.net'
    'korea.services.net'
    'misc.dnsbl.sorbs.net'
    'noptr.spamrats.com'
    'ohps.dnsbl.net.au'
    'omrs.dnsbl.net.au'
    'orvedb.aupads.org'
    'osps.dnsbl.net.au'
    'osrs.dnsbl.net.au'
    'owfs.dnsbl.net.au'
    'owps.dnsbl.net.au'
    'pbl.spamhaus.org'
    'phishing.rbl.msrbl.net'
    'probes.dnsbl.net.au'
    'proxy.bl.gweep.ca'
    'proxy.block.transip.nl'
    'psbl.surriel.com'
    'rbl.interserver.net'
    'rdts.dnsbl.net.au'
    'relays.bl.gweep.ca'
    'relays.bl.kundenserver.de'
    'relays.nether.net'
    'residential.block.transip.nl'
    'ricn.dnsbl.net.au'
    'rmst.dnsbl.net.au'
    'sbl.spamhaus.org'
    'short.rbl.jp'
    'smtp.dnsbl.sorbs.net'
    'socks.dnsbl.sorbs.net'
    'spam.abuse.ch'
    'spam.dnsbl.sorbs.net'
    'spam.spamrats.com'
    'spamlist.or.kr'
    'spamrbl.imp.ch'
    't3direct.dnsbl.net.au'
    'tor.dnsbl.sectoor.de'
    'torserver.tor.dnsbl.sectoor.de'
    'ubl.lashback.com'
    'ubl.unsubscore.com'
    'virbl.bit.nl'
    'virus.rbl.jp'
    'virus.rbl.msrbl.net'
    'web.dnsbl.sorbs.net'
    'wormrbl.imp.ch'
    'xbl.spamhaus.org'
    'zombie.dnsbl.sorbs.net'
    'access.redhawk.org'
    'all.rbl.jp'
    'all.s5h.net'
    'all.spamrats.com'
    'aspews.ext.sorbs.net'
    'b.barracudacentral.org'
    'backscatter.spameatingmonkey.net'
    'bb.barracudacentral.org'
    'bl.blocklist.de'
    'bl.drmx.org'
    'bl.fmb.la'
    'bl.konstant.no'
    'bl.mailspike.net'
    'bl.mav.com.br'
    'bl.nosolicitado.org'
    'bl.nszones.com'
    'bl.scientificspam.net'
    'bl.score.senderscore.com'
    'bl.spamcop.net'
    'bl.spameatingmonkey.net'
    'bl.suomispam.net'
    'blacklist.woody.ch'
    'block.ascams.com'
    'block.dnsbl.sorbs.net'
    'bsb.empty.us'
    'bsb.spamlookup.net'
    'cbl.abuseat.org'
    'cbl.anti-spam.org.cn'
    'cblless.anti-spam.org.cn'
    'cblplus.anti-spam.org.cn'
    'cdl.anti-spam.org.cn'
    'cidr.bl.mcafee.com'
    'combined.rbl.msrbl.net'
    'db.wpbl.info'
    'dnsbl-1.uceprotect.net'
    'dnsbl-2.uceprotect.net'
    'dnsbl-3.uceprotect.net'
    'dnsbl.anticaptcha.net'
    'dnsbl.calivent.com.pe'
    'dnsbl.cobion.com'
    'dnsbl.dronebl.org'
    'dnsbl.inps.de'
    'dnsbl.justspam.org'
    'dnsbl.kempt.net'
    'dnsbl.net.ua'
    'dnsbl.rv-soft.info'
    'dnsbl.rymsho.ru'
    'dnsbl.sorbs.net'
    'dnsbl.spam-champuru.livedoor.com'
    'dnsbl.tornevall.org'
    'dnsbl.webequipped.com'
    'dnsbl.zapbl.net'
    'dnsrbl.swinog.ch'
    'dul.dnsbl.sorbs.net'
    'dul.pacifier.net'
    'dyn.nszones.com'
    'dyna.spamrats.com'
    'escalations.dnsbl.sorbs.net'
    'fnrbl.fast.net'
    'forbidden.icm.edu.pl'
    'http.dnsbl.sorbs.net'
    'images.rbl.msrbl.net'
    'ipbl.zeustracker.abuse.ch'
    'ips.backscatterer.org'
    'ix.dnsbl.manitu.net'
    'korea.services.net'
    'l1.bbfh.ext.sorbs.net'
    'l2.apews.org'
    'l2.bbfh.ext.sorbs.net'
    'list.bbfh.org'
    'list.quorum.to'
    'mail-abuse.blacklist.jippg.org'
    'misc.dnsbl.sorbs.net'
    'multi.surbl.org'
    'netbl.spameatingmonkey.net'
    'netscan.rbl.blockedservers.com'
    'new.spam.dnsbl.sorbs.net'
    'noptr.spamrats.com'
    'old.spam.dnsbl.sorbs.net'
    'pbl.spamhaus.org'
    'phishing.rbl.msrbl.net'
    'pofon.foobar.hu'
    'problems.dnsbl.sorbs.net'
    'projecthoneypot.org'
    'proxies.dnsbl.sorbs.net'
    'psbl.surriel.com'
    'rbl.abuse.ro'
    'rbl.blockedservers.com'
    'rbl.dns-servicios.com'
    'rbl.efnet.org'
    'rbl.efnetrbl.org'
    'rbl.interserver.net'
    'rbl.iprange.net'
    'rbl.lugh.ch'
    'rbl.polarcomm.net'
    'rbl.realtimeblacklist.com'
    'rbl.scrolloutf1.com'
    'rbl.talkactive.net'
    'rbl2.triumf.ca'
    'recent.spam.dnsbl.sorbs.net'
    'relays.dnsbl.sorbs.net'
    'rep.mailspike.net'
    'safe.dnsbl.sorbs.net'
    'sbl.nszones.com'
    'sbl.spamhaus.org'
    'short.rbl.jp'
    'singular.ttk.pte.hu'
    'smtp.dnsbl.sorbs.net'
    'socks.dnsbl.sorbs.net'
    'spam.dnsbl.anonmails.de'
    'spam.dnsbl.sorbs.net'
    'spam.pedantic.org'
    'spam.rbl.blockedservers.com'
    'spam.rbl.msrbl.net'
    'spam.spamrats.com'
    'spamguard.leadmon.net'
    'spamlist.or.kr'
    'spamrbl.imp.ch'
    'spamsources.fabel.dk'
    'srn.surgate.net'
    'st.technovision.dk'
    'superblock.ascams.com'
    'torexit.dan.me.uk'
    'truncate.gbudb.net'
    'ubl.unsubscore.com'
    'virus.rbl.jp'
    'virbl.bit.nl'
    'ubl.lashback.com'
    'reputation.vircom.com'
    'virus.rbl.msrbl.net'
    'vote.drbl.caravan.ru'
    'vote.drbl.gremlin.ru'
    'web.dnsbl.sorbs.net'
    'web.rbl.msrbl.net'
    'work.drbl.caravan.ru'
    'work.drbl.gremlin.ru'
    'wormrbl.imp.ch'
    'xbl.spamhaus.org'
    'z.mailspike.net'
    'zen.spamhaus.org'
    'zombie.dnsbl.sorbs.net'
    'bl.deadbeef.com'
    'blackholes.five-ten-sg.com'
    'bogons.cymru.com'
    'combined.abuse.ch'
    'dnsbl.njabl.org'
    'drone.abuse.ch'
    'duinv.aupads.org'
    'dul.ru'
    'ohps.dnsbl.net.au'
    'omrs.dnsbl.net.au'
    'orvedb.aupads.org'
    'osps.dnsbl.net.au'
    'osrs.dnsbl.net.au'
    'owfs.dnsbl.net.au'
    'owps.dnsbl.net.au'
    'probes.dnsbl.net.au'
    'proxy.bl.gweep.ca'
    'proxy.block.transip.nl'
    'rdts.dnsbl.net.au'
    'relays.bl.gweep.ca'
    'relays.bl.kundenserver.de'
    'relays.nether.net'
    'residential.block.transip.nl'
    'ricn.dnsbl.net.au'
    'rmst.dnsbl.net.au'
    'spam.abuse.ch'
    't3direct.dnsbl.net.au'
    'ubl.lashback.com'
    'virbl.bit.nl'
)
$IP | % {

    $reversedIP = ($_ -split '\.')[3..0] -join '.'
    $blacklistedOn = @()

    foreach ($server in $blacklistServers)
    {
        $fqdn = "$reversedIP.$server"
        Write-Host "Check IP $_ on Blacklist $server"
		Write-Log "Check IP $_ on Blacklist $server"
        try
        {
            $null = [System.Net.Dns]::GetHostEntry($fqdn)
            $blacklistedOn += $server
            Write-Host "$_ is blacklisted on $server"
			Write-Log "$_ is blacklisted on $server" 1
        }
        catch { }
    }

    if ($blacklistedOn.Count -gt 0){
        $ResultTextForEmailString = "${ResultTextForEmailString}<font color=`"red`">$_ is blacklisted by: $($blacklistedOn -join ', ')</font><br>`r`n"
    }else{
        $ResultTextForEmailString = "${ResultTextForEmailString}<font color=`"green`">$_ is OK</font><br>`r`n"
    }

}


#########################################################################################
#
# Send Email
#
#########################################################################################




# HTML Email
$to      =  "your@email.com"     #Change to your Resivig Email Adress
$from    =  "your@email.com"     #Change to your Sending Email Adress
$subject =  "Blacklist Check"
$body    =  "This is a Blacklist Check Email for the Domains <a href=https://your.emailserver.com</a>"
$body    += "$ResultTextForEmailString"      

# Sender Credentials
$Username = "your@email.com"  #Change to your Username
$Password = "password"     #Change to your Password

# Create the message
$mail = New-Object System.Net.Mail.Mailmessage $from, $to, $subject, $body
$mail.IsBodyHTML=$true

# Create an SMTP Server Object
$server = "smtp.gmail.com"    #Change to your smtp server adress
$port   = 587
$Smtp = New-Object System.Net.Mail.SMTPClient $server,$port
$Smtp.Credentials = New-Object System.Net.NetworkCredential($Username,$Password)
$Smtp.EnableSsl = $true

# Send send the Mail
$smtp.send($mail)




Write-Progress -Activity "Overall" -PercentComplete 100 -Status "Done";




