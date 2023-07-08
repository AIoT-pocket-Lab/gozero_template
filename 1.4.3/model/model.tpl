package {{.pkg}}
{{if .withCache}}
import (
	"context"
	"fmt"

	"github.com/zeromicro/go-zero/core/stores/cache"
	"github.com/zeromicro/go-zero/core/stores/sqlc"
	"github.com/zeromicro/go-zero/core/stores/sqlx"
	"hh"
)
{{else}}

import (
	"context"

	"github.com/zeromicro/go-zero/core/stores/sqlx"
)
{{end}}

var _ {{.upperStartCamelObject}}Model = (*custom{{.upperStartCamelObject}}Model)(nil)

type (
	// {{.upperStartCamelObject}}Model is an interface to be customized, add more methods here,
	// and implement the added methods in custom{{.upperStartCamelObject}}Model.
	{{.upperStartCamelObject}}Model interface {
		{{.lowerStartCamelObject}}Model
		Trans(ctx context.Context,fn func(context context.Context,session sqlx.Session) error) error
		FindList(ctx context.Context, sqlWhere string) ([]*{{.upperStartCamelObject}}, error)
	}

	custom{{.upperStartCamelObject}}Model struct {
		*default{{.upperStartCamelObject}}Model
	}
)

// New{{.upperStartCamelObject}}Model returns a model for the database table.
func New{{.upperStartCamelObject}}Model(conn sqlx.SqlConn{{if .withCache}}, c cache.CacheConf{{end}}) {{.upperStartCamelObject}}Model {
	return &custom{{.upperStartCamelObject}}Model{
		default{{.upperStartCamelObject}}Model: new{{.upperStartCamelObject}}Model(conn{{if .withCache}}, c{{end}}),
	}
}

// 暴露 session 事务处理(原子性操作)
func (m *default{{.upperStartCamelObject}}Model) Trans(ctx context.Context,fn func(ctx context.Context,session sqlx.Session) error) error {
	{{if .withCache}}
	return m.TransactCtx(ctx,func(ctx context.Context,session sqlx.Session) error {
		return  fn(ctx,session)
	})
	{{else}}
	return m.conn.TransactCtx(ctx,func(ctx context.Context,session sqlx.Session) error {
		return  fn(ctx,session)
	})
	{{end}}
}

// 根据 sql where 条件语句 进行查询
func (m *default{{.upperStartCamelObject}}Model) FindList(ctx context.Context, sqlWhere string) ([]*{{.upperStartCamelObject}}, error) {
	whereString := ""
	if len(sqlWhere) != 0 {
		whereString = "where " + sqlWhere
	}
	query := fmt.Sprintf("select %s from %s %s", {{.lowerStartCamelObject}}Rows, m.table, whereString)

	var resp []*{{.upperStartCamelObject}}
	{{if .withCache}}
	err := m.QueryRowsNoCacheCtx(ctx, &resp, query)
	{{else}}
	err := m.conn.QueryRowsCtx(ctx, &resp, query)
	{{end}}
	switch err {
		case nil:
			return resp, nil
		case sqlc.ErrNotFound:
			return nil, ErrNotFound
		default:
			return nil, err
	}
}
