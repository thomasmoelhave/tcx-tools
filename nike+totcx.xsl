<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
		xsi:schemaLocation="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2  http://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd"
		xmlns:ns5="http://www.garmin.com/xmlschemas/ActivityGoals/v1"
		xmlns:ns3="http://www.garmin.com/xmlschemas/ActivityExtension/v2"
		xmlns:ns2="http://www.garmin.com/xmlschemas/UserProfile/v2"
		xmlns="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xmlns:ns4="http://www.garmin.com/xmlschemas/ProfileExtension/v1"
		xmlns:date="http://exslt.org/dates-and-times"
		extension-element-prefixes="date"
>
   
   <!-- EXSLT (http://www.exslt.org/) template is needed for date-time calculations and can be downloaded from
         http://www.exslt.org/date/functions/add/date.add.template.xsl -->
   <xsl:import href="date.add.template.xsl"/>
   <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

   <xsl:template match="plusService">
      <xsl:apply-templates select="sportsData"/>
   </xsl:template>

   <xsl:template match="sportsData">
      <TrainingCenterDatabase>
	<Activities>
	  <Activity Sport="Running">
	   <Id>
	     <xsl:value-of select="startTime"/>
	   </Id>
	   <Lap>	   
	     <xsl:attribute name="StartTime">
	       <xsl:value-of select="startTime"/>
	     </xsl:attribute>

	     <xsl:variable name="st">
	       <xsl:value-of select="startTime"/>
	     </xsl:variable>


	     <TotalTimeSeconds><xsl:value-of select="runSummary/duration div 1000"/> </TotalTimeSeconds>

	     <DistanceMeters><xsl:value-of select="runSummary/distance * 1000"/></DistanceMeters>

	     <Calories><xsl:value-of select="runSummary/calories"/></Calories>

              <Track>

                  <xsl:choose>
                     <xsl:when test="extendedDataList/extendedData[@dataType='distance' and @intervalType='time' and @intervalUnit='s']">

		       <xsl:variable name="formatted_interval">PT10S</xsl:variable>

                        <xsl:call-template name="distance_point">
                           <xsl:with-param name="csvdata" select="extendedDataList/extendedData[@dataType='distance' and @intervalType='time' and @intervalUnit='s']"/>
			   <xsl:with-param name="interval" select="$formatted_interval"/>
                           <xsl:with-param name="time" select="$st"/>
                        </xsl:call-template>

                     </xsl:when>

                  </xsl:choose>

               </Track>
	   </Lap>
	 </Activity>
	</Activities>
      </TrainingCenterDatabase>
   </xsl:template>

   <!-- Recursive template to extract sample data -->
   <xsl:template name="distance_point">
      <xsl:param name="csvdata"/>
      <xsl:param name="interval"/>
      <xsl:param name="time" select="."/>
             
      <xsl:choose>
         <xsl:when test="contains($csvdata, ',')">
	   
            <Trackpoint>
	      <DistanceMeters><xsl:value-of select="number(substring-before($csvdata, ',')) * 1000"/></DistanceMeters>
	      <Time><xsl:value-of select="$time"/></Time>
            </Trackpoint>
	    
 	    <xsl:variable name="new_time" >
	      <xsl:call-template name="date:add">
		<xsl:with-param name="date-time" select="$time" />
		<xsl:with-param name="duration" select="$interval" />
	      </xsl:call-template>
	    </xsl:variable>
      

            <xsl:call-template name="distance_point">
               <xsl:with-param name="csvdata" select="substring-after($csvdata, ',')"/>
               <xsl:with-param name="interval" select="$interval"/>
	       <xsl:with-param name="time" select="$new_time"/>
	    </xsl:call-template>

         </xsl:when>

         <xsl:otherwise>
	   <Trackpoint>
	      <DistanceMeters><xsl:value-of select="number($csvdata)*1000"/></DistanceMeters>
	      <Time><xsl:value-of select="$time"/></Time>
	   </Trackpoint>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>


</xsl:stylesheet>
