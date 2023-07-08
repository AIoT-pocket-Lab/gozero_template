package model

import (
	"time"

	"go.mongodb.org/mongo-driver/bson/primitive"
)

type {{.Type}} struct {
	Id primitive.ObjectID `bson:"_id,omitempty" json:"id,omitempty"`
	// TODO: Fill your own fields
	CreateTime time.Time `bson:"create_time,omitempty" json:"create_time,omitempty"`
	UpdateTime time.Time `bson:"update_time,omitempty" json:"update_time,omitempty"`
}
