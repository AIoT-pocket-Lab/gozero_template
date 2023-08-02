package {{.PkgName}}

import (
    "net/http"

    "zyda-iot_server/common/responsex"
    {{.ImportPackages}}

	"github.com/zeromicro/go-zero/rest/httpx"
)

func {{.HandlerName}}(svcCtx *svc.ServiceContext) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        {{if .HasRequest}}var req types.{{.RequestType}}
        if err := httpx.Parse(r, &req); err != nil {
            httpx.Error(w, err)
            return
        }{{end}}

        l := logic.New{{.LogicType}}(r.Context(), svcCtx)
        {{if .HasResp}}resp, {{end}}err := l.{{.Call}}({{if .HasRequest}}&req{{end}})
        {{if .HasResp}}responsex.Responsex(w, resp, err, "{{.Call}}"){{else}}responsex.Responsex(w, nil, err, "{{.Call}}"){{end}}
    }
}
