Karl's Audible Warning Bike ( or Bluetooth ) System ( kawbs )
KAWBs ( pronounced korbs , although you can say K A W B S if you really want ! )
--------------------------------------------------------------------------------
2020-06-24
----------

The aim of this project is to inform a motorcycle rider of speed, and normal dash board indicators via a bluetooth audio connection to their helmet headset.
Thus the rider doesn't have to look at the dash as much, and is hopefully less likely to crash.

It might even be useful in cars, although seeing the dash on those is easier than on
a bike, so I don't really see the point.

It will use a Rapberry Pi, an USB OBD2 interface to the motocycle's computer and optionally use a USB GPS receiver, for speed or journey tracking (journey tracking is a future feature)

The aim is it will be designed to run on a Raspberry Pi. Probably best with a Pi 3 with Wifi and Bluetooth.
You could use a Pizero W, although they can be a bit slow, and they're hard to purchase.
A Pi 2 with bluetooth and wifi USB dongles.
A Pi 4, I don't know, maybe. On a Pi 4 , do you want the expense, PSU requirements, and cooling challenges ? Do you need something that powerful ? Maybe, maybe not.

The bluetooth will only be used for the audio connection to the headset. Bluetooth audio can be a bit unreliable and thus trying to have a bluetooth OBD2 scanner doesn't seem like a good idea. I want reliable audio.

The wifi will also be switchable. Apparently bluetooth audio on a Pi can be badly affected by wifi running simultaneously. So most of the time the wifi will be off.


Why did I do this ?
-------------------
I recently became a middle aged motorcyclist. One of the things I've found is it's harder to safely look at the dash on a motorcycle as compared to a car, and also concentrate on riding. There's often a larger angle looking down at the dash, plus on a motorcycle you do need to be more focused on the road as compared to a car. Even small mistakes on motorcycles can be catastrophic. You can briefly lose minor control of a car and there is more leeway for correcting mistakes.

I did look at and consider commercially availabe Head Up Displays, but currently available ones look very expensive, somewhat flaky, and often become unsupported. Plus I came to the conclusion that my eyes should really be focusing on the road, not on an head up display.

Head up displays would be close to the eyes, even with clever optics, the eyes are not focussing on the road. So they could still be a distraction. Although I would like to test one.

A self made head up display looks hard to implement into the helmet in a safe and aesthetically pleasing way.

Bluetooth audio headsets, well there's lots of them already available. All I need to do is supply the audible warnings via a Raspberry Pi from the ODB2, GPS sensor and some GPIO wiring into the motorcycles electrics.

Most ( all ? ) of the information I need could be audible.


Main Aims.
---------
Whilst riding the information that I've mainly found I need is :

    Current Speed (There are smart phone apps that do this audibly, but I haven't found a good one yet.)
    my indicators are left on. (more bikes should really have self cancelling indicators)
    I am in too high a gear when I come to a stop. ( yes I am a new rider ! )


Nice to have would be :
    some warning light has come on.
    OBD2 is showing a fault code or engine problem.
    low fuel warnings . Not essential since I really don't find I need to look at that often. There's usually at least a 30 to 40 mile range on the bikes I've tried once the light is on.

I also want easily available buttons on the handlebars to enable/disable audible warnings. Something that isn't possible or easy with bluetooth smart phone talking speedo apps. A physical, simple push button in a good place on the handlebars would be a lot better.

Logging of various ODB2 sensors could provide some interesting geeky statistics for those inclined to look at them. Probably not the average motorcyclist. I might be interested ...

Speed Camera alerts, and current road speed limit would be nice, but that would require DBs and maps. Currently beyond the initial scope of this project, unless I can find someway to linking what's available on a smart phone in someway, or someone else wants to contribute !



Control Interface.
------------------
The Pi will run a web gui, Wifi AP, so a smart phone can connect, and configure the options available.


Future Ideas.
-------------
Above I dismissed the idea of a HUD. But a few flashing LEDs inside the helmet could be useful. Just out of the main view. i.e. at the top or bottom of a full face helmet's visor.

These could be useful as follows.

Green LED(s) . Maybe just one, maybe 2. Flashing, to show indicators are on.
    if 2 LEDs , then one on the left, one on the right. i.e. indicating the direction the
    indicators are flashing.

Red LED for important engine, bike warnings.
    This again could mean less audio announcements.

Orange LED for
    # permanently on . fuel level. (Assuming fuel level is possible to get via ODB2)
    # flashing . Too high a gear if the bike is below 10 MPH / 16 KPH.

Blue LED for main headlight beam. But this doesn't seem worth the effort. ODB2 (like the indicators ) will not have this, plus it's more wiring into the bike's wiring loom.
Wiring into the loom for indicators seems worth the effort. Main beam, well that's at night, and you can see if the main beam is on !

Having a few LEDs in the helmet is much easier than a full blown HUD for a hobbyist geek to implement. It would free up the audio for something else, like Speed annoucements.

The LEDs could be controlled with an ESP8266 wifi module, but this would mean connecting to the pi via wifi.

Alternative connectivity ideas are have a PiZero W at the helmet end.
The Pizero W would be responsible for flashing LEDs inside the visor and audio. i.e. No bluetooth audio connection to the main Pi (probably under the seat) that is polling the ODB2 port and bike indicator wiring. Bluetooth audio on Pi's is very painful.

Other ideas are a mobile phone app, that could wifi/bluetooth to the Pi under the seat.
The app would do the audio announcements for the OBD2 and bike loom wiring information the Pi gets. But I don't  know how to program Android / IOS apps. So someone else can implement that one !

