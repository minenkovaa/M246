<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="theorem|corollary|lemma|algorithm|proposition|claim|fact|identity" mode="serial-number">
    <xsl:number from="part" level="any" count="theorem|corollary|lemma|algorithm|proposition|claim|fact|identity"/>
  </xsl:template>

  <xsl:template match="definition" mode="serial-number">
    <xsl:number from="part" level="any" count="definition"/>
  </xsl:template>

  <xsl:template match="example|question|problem" mode="serial-number">
    <xsl:number from="part" level="any" count="example|question|problem"/>
  </xsl:template>
</xsl:stylesheet>
