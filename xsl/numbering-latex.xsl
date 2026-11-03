<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="./core/pretext-latex.xsl"/>
  <xsl:include href="./numbering-overrides.xsl"/>

  <xsl:template match="part|chapter|appendix|section|subsection|subsubsection|acknowledgement|foreword|preface|index|exercises|solutions|worksheet|handout|reading-questions|glossary|references">
    <xsl:text>\color{black}%&#xa;</xsl:text>
    <xsl:apply-imports/>
  </xsl:template>

  <xsl:template match="theorem|corollary|lemma|algorithm|proposition|claim|fact|identity|definition|example|question|problem" mode="environment">
    <xsl:variable name="environment-name" select="local-name(.)"/>
    <xsl:variable name="counter">
      <xsl:choose>
        <xsl:when test="self::definition">definition-distinct</xsl:when>
        <xsl:when test="self::example or self::question or self::problem">example-distinct</xsl:when>
        <xsl:otherwise>theorem-distinct</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="generate-id(.) = generate-id(($document-root//theorem|$document-root//corollary|$document-root//lemma|$document-root//algorithm|$document-root//proposition|$document-root//claim|$document-root//fact|$document-root//identity)[1])">
      <xsl:text>\newtcolorbox[auto counter]{theorem-distinct}{}&#xa;</xsl:text>
    </xsl:if>
    <xsl:if test="generate-id(.) = generate-id(($document-root//definition)[1])">
      <xsl:text>\newtcolorbox[auto counter]{definition-distinct}{}&#xa;</xsl:text>
    </xsl:if>
    <xsl:if test="generate-id(.) = generate-id(($document-root//example|$document-root//question|$document-root//problem)[1])">
      <xsl:text>\newtcolorbox[auto counter]{example-distinct}{}&#xa;</xsl:text>
    </xsl:if>
    <xsl:text>%% </xsl:text>
    <xsl:value-of select="$environment-name"/>
    <xsl:text>: numbered block with an independent counter&#xa;</xsl:text>
    <xsl:text>\tcbset{ </xsl:text>
    <xsl:value-of select="$environment-name"/>
    <xsl:text>style/.style={</xsl:text>
    <xsl:apply-templates select="." mode="tcb-style"/>
    <xsl:text>} }&#xa;</xsl:text>
    <xsl:text>\newtcolorbox[use counter from=</xsl:text>
    <xsl:value-of select="$counter"/>
    <xsl:text>]{</xsl:text>
    <xsl:value-of select="$environment-name"/>
    <xsl:text>}</xsl:text>
    <xsl:choose>
      <xsl:when test="self::theorem or self::corollary or self::lemma or self::algorithm or self::proposition or self::claim or self::fact or self::identity">
        <xsl:text>[4]{title={{#1~\thetcbcounter\notblank{#2#3}{\space}{}\notblank{#2}{\space#2}{}\notblank{#3}{\space(#3)}{}}}, phantomlabel={#4}, breakable, after={\par}, fontupper=\itshape, </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>[3]{title={{#1~\thetcbcounter\notblank{#2}{\space\space#2}{}}}, phantomlabel={#3}, breakable, after={\par}, </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="$environment-name"/>
    <xsl:text>style, }&#xa;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
