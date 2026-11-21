#!/bin/sh

kubectl port-forward -n database svc/postgres 5433:5432