# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  # Could not dump table "allergyintolerance" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "bundle" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "capabilitystatement" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "careplan" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "careteam" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "codesystem" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "conceptmap" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "condition" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "device" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "diagnosticreport" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "documentreference" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "encounter" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "goal" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "immunization" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "implementationguide" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  create_table 'items', id: false, force: :cascade do |t|
    t.bigserial 'id', null: false
    t.string 'name'
    t.boolean 'done'
    t.integer 'todo_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  # Could not dump table "location" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "medication" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "observation" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "operationdefinition" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "organization" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "patient" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "practitioner" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "procedure" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "searchparameter" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  # Could not dump table "structuredefinition" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'

  create_table 'transaction', id: false, force: :cascade do |t|
    t.integer 'id', null: false
    t.datetime 'ts', default: -> { 'CURRENT_TIMESTAMP' }
    t.jsonb 'resource'
  end

  # Could not dump table "valueset" because of following StandardError
  #   Unknown type 'resource_status' for column 'status'
end
