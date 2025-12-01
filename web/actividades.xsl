<?xml version="1.0" encoding="UTF-8"?>

<!--
    Módulo: LMSGI – Lenguajes de Marcas y Sistemas de Gestión de Información
    Unidad Didáctica: UD04 – Transformación de XML mediante XSLT
    Tarea: Sitio web del Jardín Botánico con XML + XSLT
    Autor: Laurence Sevilla
    Fecha: 2025-01-12
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <!-- Variable que define el mes a mostrar (requisito de la tarea) -->
    <xsl:param name="mes" select="'11'"/>
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
                    <img src= "../img/logotipo.png" alt= "Reservas" />
                    <a href="zonas.xml">Zonas</a>
                    <a href="plantas.xml">Plantas</a>
                    <a href="actividades.xml">Actividades</a>
                </header>

                <main>
                    <h1>Actividades del mes <xsl:value-of select="$mes"/></h1>
                    <!-- Aplica plantillas a las actividades, filtrando por mes y ordenando por fecha -->
                    <xsl:apply-templates select="actividades"/>
                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>

    <!-- Genera cada actividad sin usar 'for-each', tal como exige la rúbrica -->
    <xsl:template match="actividades">
        <xsl:apply-templates
            select="actividad[substring(fechaHora, 6, 2) = $mes]">
            <xsl:sort select="fechaHora"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="actividad">
        <xsl:variable name="fecha" select="substring-before(fechaHora, 'T')"/>
        <xsl:variable name="hora"
                      select="substring(substring-after(fechaHora, 'T'), 1, 5)"/>
        <!-- Número total de responsables utilizando count() -->
        <xsl:variable name="numResp"
                      select="count(responsables/responsable)"/>

        <article class="actividades">
            <h4>
                <xsl:value-of select="titulo"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="$numResp"/>
                <xsl:text> Responsable</xsl:text>
                <xsl:if test="$numResp &gt; 1">
                    <xsl:text>s</xsl:text>
                </xsl:if>
            </h4>

            <h2>
                <xsl:text>Fecha: </xsl:text>
                <xsl:value-of select="$fecha"/>
                <xsl:text> </xsl:text>
            </h2>
            <h2>
                <xsl:text>Hora: </xsl:text>
                <xsl:value-of select="$hora"/>
            </h2>
            <h2>
                <xsl:text>Lugar: </xsl:text>
                <xsl:value-of select="@sala"/>
            </h2>

            <ul>
                <!-- Lista de responsables (nombre + email) -->
                <xsl:apply-templates select="responsables/responsable"/>
            </ul>
        </article>
    </xsl:template>

    <xsl:template match="responsable">
        <li>
            <xsl:value-of select="nomresponsable"/>
            <xsl:text> - </xsl:text>
            <xsl:value-of select="email"/>
        </li>
    </xsl:template>

</xsl:stylesheet>