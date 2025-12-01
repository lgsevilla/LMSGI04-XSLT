<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/jardinBotanico">
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>

            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas"/>
                    <a href="zonas.xml">Zonas</a>
                    <a href="plantas.xml">Plantas</a>
                    <a href="actividades.xml">Actividades</a>
                </header>

                <main id="jardinbotanico">
                    <h1>PLANTAS</h1>

                    <xsl:for-each select="plantas/planta">
                        <article class="articulo">

                            <img class="imagen">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="concat('../img/', @foto)"/>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="nombreComun"/>
                                </xsl:attribute>
                            </img>

                            <!-- estrella si la lumonosidad es alta -->
                            <xsl:if test="luminosidad = 'Alta'">
                                <img src="../img/Alta.png"
                                     class="alta-icono"
                                     alt="Alta luminosidad"/>
                            </xsl:if>

                            <h2>
                                <a target="_blank">
                                    <xsl:attribute name="href">
                                        <xsl:value-of
                                                select="concat('https://es.wikipedia.org/wiki/', @familia)"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="nombreComun"/>
                                </a>
                            </h2>

                            <h3>
                                <xsl:value-of select="luminosidad"/>
                            </h3>
                        </article>
                    </xsl:for-each>
                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>