<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
		xsi:schemaLocation="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2  http://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd"
		xmlns:ns5="http://www.garmin.com/xmlschemas/ActivityGoals/v1"
		xmlns:ns3="http://www.garmin.com/xmlschemas/ActivityExtension/v2"
		xmlns:ns2="http://www.garmin.com/xmlschemas/UserProfile/v2"
		xmlns:g="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xmlns:ns4="http://www.garmin.com/xmlschemas/ProfileExtension/v1"
>
<xsl:param name="LONGITUDE"/>
<xsl:param name="LATITUDE"/>
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />


    <xsl:template match="node()|@*">
      <xsl:copy>
         <xsl:apply-templates select="node()|@*"/>
      </xsl:copy>
    </xsl:template>

 <!--   <xsl:template match="HeartRateBpm" /> -->
    <xsl:template match="AverageHeartRateBpm" />
    <xsl:template match="MaximumHeartRateBpm" />

	<!-- Since the HR is wrong, the calories are most likely
		 also wrong, so delete them as well -->
    <xsl:template match="g:Trackpoint">
	<Trackpoint>
		<xsl:apply-templates/>
		<Position>
			<LongitudeDegrees><xsl:value-of select="$LONGITUDE"/></LongitudeDegrees>
			<LatitudeDegrees><xsl:value-of select="$LATITUDE"/></LatitudeDegrees>
		</Position>
	</Trackpoint>

	</xsl:template>


</xsl:stylesheet>
