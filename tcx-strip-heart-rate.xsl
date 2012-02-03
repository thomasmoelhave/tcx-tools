<xsl:stylesheet version="1.0"
 xmlns:garmin="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:output />


    <xsl:template match="node()|@*">
      <xsl:copy>
         <xsl:apply-templates select="node()|@*"/>
      </xsl:copy>
    </xsl:template>

    <xsl:template match="garmin:HeartRateBpm" />
    <xsl:template match="garmin:AverageHeartRateBpm" />
    <xsl:template match="garmin:MaximumHeartRateBpm" />

	<!-- Since the HR is wrong, the calories are most likely
		 also wrong, so delete them as well -->
    <xsl:template match="garmin:Calories" />


</xsl:stylesheet>
