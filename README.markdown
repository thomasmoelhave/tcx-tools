TCX-Tools
===========

TCX-Tools is a suite of tools that perform helpful operations on TCX
files such as:

  * *nike+totcx* Convert XML Files with iPod foot-pod data from Nike+
     to TCX files.

  * *tcx-add-gps-coordinate* Add a GPS coordinate to an existing TCX
     file without location information.

  * *tcx-strip-heart-rate* Removing heart rate information from an
     existing TCX file.

These tools were written to make Endomondo a little more flexible. For
instance, heart rate data from indoor workouts is not supported - but
adding a single GPS coordinate to the file (such as the location of
the gym) is enough to convince Endomondo to display the heart rate
data.

Installation
-------------

First clone the repository 

	git clone git://

	cd tcx-tools


You will need to install Saxon

	sudo aptitude install libsaxon-java

To use nike+totcx to convert Nike+ XML files to TCX files you also
need to download the EXSLT template:


	 wget  http://www.exslt.org/date/functions/add/date.add.template.xsl 

nike+totcx
-------------


The nike+totcx tool is an xsl document that can be used to convert
information from a standard Nike+ foot-pod system paired with an iPod
to the TCX files supported by Endomondo and Garmin Connect (and many
others).


**Getting the data**


Mount your iPod and find the directory containing the .xml files for
the individual workouts. On my iPod the workouts are stored in the
directory


      /media/<ipod name>/iPod_Control/Device/Trainer/Workouts/


It is also possible to get the xml files of past runs from the Nike+
website, but it involves some trickery.


**Running**


	./nike+totcx <input xml file> <output tcx file> 


tcx-add-gps-coordinate
-----------------------

As explained above this tool adds a single GPS coordinate (lat,long)
to the tcx file. Doing this will coerce Endomondo to display the heart
rate graph that it otherwise wouldn't display.


**Running**

	
	./tcx-add-gps-coordinate <input tcx file> <output tcx file> <lat> <long>


tcx-strip-heart-rate
--------------------

If you have been out exercising with a companion that used a gps and
heart rate monitoring device, you may want to import the GPS trace but
not the heart rate information into your own account (on Endomondo,
Garmin Connect or other tool). This tool strips the heart rate (and
calorie) information from the supplied tcx file, but keeps everything
else.


**Running**


	./tcx-strip-heart-rate <input tcx file> <output tcx file>

	
Author
---------
Thomas Mølhave - http://moelhave.com

