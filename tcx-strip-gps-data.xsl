<xsl:stylesheet version="1.0"
 xmlns:garmin="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:output />


    <xsl:template match="node()|@*">
      <xsl:copy>
         <xsl:apply-templates select="node()|@*"/>
      </xsl:copy>
    </xsl:template>

    <xsl:template match="garmin:AltitudeMeters" />
    <xsl:template match="garmin:DistanceMeters" />
    <xsl:template match="garmin:Position" />
    <xsl:template match="garmin:MaximumSpeed" />


</xsl:stylesheet>
