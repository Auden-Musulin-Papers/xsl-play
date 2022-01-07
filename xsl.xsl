<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" indent="yes"
        omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html lang="en">
            <head>
                <!-- Required meta tags -->
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>

                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                    rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous"/>

                <title>Hello, world!</title>
            </head>
            <body>
                
                <div class="p-5 mb-4 bg-light rounded-3">
                    <div class="container-fluid py-5">
                        <h1 class="display-5 fw-bold"><xsl:value-of select=".//tei:title[1]/text()"/></h1>
                        <p class="col-md-8 fs-4">
                            <xsl:apply-templates select=".//tei:p"/>
                        </p>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"/>
            </body>
        </html>

    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    <xsl:template match="tei:gap">
        <del>
            <xsl:choose>
                <xsl:when test="@reason">
                    <abbr>
                        <xsl:attribute name="title"><xsl:value-of select="data(@reason)"/></xsl:attribute>
                        [<xsl:apply-templates/>]
                    </abbr>
                </xsl:when>
                <xsl:otherwise>
                    [<xsl:apply-templates/>]
                </xsl:otherwise>
            </xsl:choose>
        </del> 
    </xsl:template>
    <xsl:template match="tei:gap">
        <del>
            <xsl:choose>
                <xsl:when test="@reason='illegible'">
                    <abbr title="unleserlich">
                        [<xsl:apply-templates/>]
                    </abbr>
                </xsl:when>
                <xsl:when test="@reason='deleted'">
                    <abbr title="gelöscht">
                        [<xsl:apply-templates/>]
                    </abbr>
                </xsl:when>
                <xsl:otherwise>
                    [<xsl:apply-templates/>]
                </xsl:otherwise>
            </xsl:choose>
        </del> 
    </xsl:template>

</xsl:stylesheet>
