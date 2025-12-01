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
                    <h1>ZONAS</h1>
                    <table>
                        <tr>
                            <th>ZONA</th>
                            <th>Ubicación</th>
                            <th>Horario</th>
                        </tr>
                        <!-- Filtra las zonas donde horarioapertura es menor o igual que 10:00 -->
                        <xsl:for-each select="zonas/zona[number(substring-before(horarioapertura, ':')) &lt;= 10]">
                            <tr>
                                <td>
                                    <xsl:value-of select="nombre"/>
                                </td>

                                <td>
                                    <!-- Marca en azul las ubicaciones que contienen "Exterior" -->
                                    <xsl:if test="contains(ubicacion, 'Exterior')">
                                        <xsl:attribute name="class">azul</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="ubicacion"/>
                                </td>

                                <td>
                                    <xsl:value-of select="concat(horarioapertura, ' - ', horariocierre)"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>