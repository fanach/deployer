package server

import (
	"github.com/fanach/deployer/server/api"
	"gopkg.in/kataras/iris.v6"
	"gopkg.in/kataras/iris.v6/adaptors/httprouter"
)

// Start launches http server
func Start() {
	ir := iris.New()
	ir.Adapt(httprouter.New())
	ir.Adapt(iris.DevLogger())

	ir.Get("/", iris.ToHandler(api.GetRoot))
	ir.Post("/deploy", iris.ToHandler(api.PostDeploy))
	ir.Post("/test", iris.ToHandler(api.PostTest))

	ir.Listen(":8080")
}
