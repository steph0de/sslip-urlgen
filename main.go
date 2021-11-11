package main

import (
	"fmt"
	"strings"

	"github.com/gin-gonic/gin"
)

type IPResponse struct {
	Name            string `json:"name"`
	GeneratedDomain string `json:"domain"`
}

func main() {
	domain_suffix := "sslip.io"
	gin.SetMode(gin.ReleaseMode)
	router := gin.Default()

	router.Static("/", "./public")
	router.POST("/v1/urlgen", func(c *gin.Context) {
		name := c.PostForm("name")
		name = strings.TrimSpace(name)
		ipaddress := c.PostForm("ipaddress")
		ipaddress = strings.TrimSpace(ipaddress)
		ipaddress = strings.Replace(ipaddress, ":", "-", -1)
		ipaddress = strings.Replace(ipaddress, ".", "-", -1)
		generatedDomain := fmt.Sprintf("%s.%s.%s", name, ipaddress, domain_suffix)
		jsonResponse := IPResponse{name, generatedDomain}

		c.JSON(200, jsonResponse)
	})
	router.Run(":8080")
}
