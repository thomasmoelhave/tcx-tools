TCX-tools
===========

This README file briefly describes how to perform the conversions and to get the xml files.


nike+totcx
-------------


The nike+totcx tool is an xsl document that can be used to convert information from a standard Nike+ foot-pod system paired with an iPod to the TCX files supported by Endomondo and Garmin Connect (and many others).

**Getting the data**

Mount your iPod and find the directory containing the .xml files for the individual workouts. On my iPod the workouts are stored in the directory

      /media/<ipod name>/iPod_Control/Device/Trainer/Workouts/

It is also possible to get the xml files of past runs from the Nike+ website, but it involves some trickery.


**Converting individual files**


Clone repository

	git clone git://
      
	cd tcx-tools


Download the EXSLT template: 


	 wget  http://www.exslt.org/date/functions/add/date.add.template.xsl 


Install Saxon:

	
	sudo aptitude install libsaxon-java


Transform file:

  	
	 saxon-xslt -o mysample.tcx mysample.xml  nike+totcx.xsl

