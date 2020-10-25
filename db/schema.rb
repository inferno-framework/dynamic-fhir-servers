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

ActiveRecord::Schema.define(version: 2020_10_16_033816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

# Could not dump table "account" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "account_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "activitydefinition" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "activitydefinition_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "adverseevent" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "adverseevent_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "allergyintolerance" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "allergyintolerance_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "appointment" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "appointment_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "appointmentresponse" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "appointmentresponse_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "auditevent" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "auditevent_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "basic" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "basic_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "binary" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "binary_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "biologicallyderivedproduct" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "biologicallyderivedproduct_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "bodystructure" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "bodystructure_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "capabilitystatement" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "capabilitystatement_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "careplan" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "careplan_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "careteam" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "careteam_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "chargeitem" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "chargeitem_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "claim" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "claim_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "claimresponse" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "claimresponse_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "clinicalimpression" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "clinicalimpression_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "codesystem" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "codesystem_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "communication" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "communication_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "communicationrequest" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "communicationrequest_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "compartmentdefinition" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "compartmentdefinition_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "composition" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "composition_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "concept" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "concept_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "conceptmap" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "conceptmap_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "condition" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "condition_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "consent" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "consent_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "contract" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "contract_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "coverage" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "coverage_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "detectedissue" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "detectedissue_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "device" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "device_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "devicecomponent" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "devicecomponent_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "devicemetric" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "devicemetric_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "devicerequest" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "devicerequest_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "deviceusestatement" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "deviceusestatement_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "diagnosticreport" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "diagnosticreport_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "documentmanifest" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "documentmanifest_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "documentreference" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "documentreference_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "eligibilityrequest" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "eligibilityrequest_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "eligibilityresponse" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "eligibilityresponse_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "encounter" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "encounter_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "endpoint" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "endpoint_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "enrollmentrequest" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "enrollmentrequest_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "enrollmentresponse" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "enrollmentresponse_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "entrydefinition" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "entrydefinition_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "episodeofcare" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "episodeofcare_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "eventdefinition" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "eventdefinition_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "examplescenario" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "examplescenario_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "expansionprofile" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "expansionprofile_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "explanationofbenefit" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "explanationofbenefit_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "familymemberhistory" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "familymemberhistory_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "flag" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "flag_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "goal" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "goal_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "graphdefinition" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "graphdefinition_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "group" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "group_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "guidanceresponse" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "guidanceresponse_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "healthcareservice" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "healthcareservice_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "imagingstudy" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "imagingstudy_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "immunization" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "immunization_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "immunizationevaluation" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "immunizationevaluation_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "immunizationrecommendation" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "immunizationrecommendation_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "implementationguide" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "implementationguide_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "invoice" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "invoice_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "iteminstance" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "iteminstance_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.boolean "done"
    t.integer "todo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["todo_id"], name: "index_items_on_todo_id"
  end

# Could not dump table "library" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "library_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "linkage" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "linkage_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "list" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "list_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "location" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "location_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "measure" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "measure_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "measurereport" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "measurereport_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "media" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "media_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medication" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medication_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicationadministration" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicationadministration_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicationdispense" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicationdispense_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicationrequest" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicationrequest_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicationstatement" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicationstatement_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproduct" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproduct_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproductauthorization" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproductauthorization_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproductclinicals" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproductclinicals_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproductdevicespec" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproductdevicespec_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproductingredient" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproductingredient_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproductpackaged" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproductpackaged_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproductpharmaceutical" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "medicinalproductpharmaceutical_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "messagedefinition" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "messagedefinition_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "messageheader" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "messageheader_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "metadataresource" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "metadataresource_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "namingsystem" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "namingsystem_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "nutritionorder" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "nutritionorder_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "observation" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "observation_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "observationdefinition" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "observationdefinition_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "occupationaldata" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "occupationaldata_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "operationdefinition" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "operationdefinition_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "operationoutcome" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "operationoutcome_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "organization" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "organization_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "organizationrole" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "organizationrole_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "parameters" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "parameters_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "patient" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "patient_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "paymentnotice" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "paymentnotice_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "paymentreconciliation" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "paymentreconciliation_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "person" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "person_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "plandefinition" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "plandefinition_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "practitioner" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "practitioner_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "practitionerrole" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "practitionerrole_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "procedure" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "procedure_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "processrequest" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "processrequest_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "processresponse" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "processresponse_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "productplan" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "productplan_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "provenance" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "provenance_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "questionnaire" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "questionnaire_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "questionnaireresponse" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "questionnaireresponse_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "relatedperson" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "relatedperson_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "requestgroup" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "requestgroup_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "researchstudy" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "researchstudy_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "researchsubject" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "researchsubject_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "riskassessment" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "riskassessment_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "schedule" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "schedule_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "sequence" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "sequence_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "servicerequest" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "servicerequest_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "slot" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "slot_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "specimen" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "specimen_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "specimendefinition" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "specimendefinition_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "structuredefinition" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "structuredefinition_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "structuremap" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "structuremap_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "subscription" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "subscription_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "substance" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "substance_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "substancepolymer" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "substancepolymer_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "substancereferenceinformation" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "substancereferenceinformation_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "substancespecification" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "substancespecification_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "supplydelivery" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "supplydelivery_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "supplyrequest" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "supplyrequest_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "task" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "task_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "terminologycapabilities" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "terminologycapabilities_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "testreport" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "testreport_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "testscript" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "testscript_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.string "created_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transaction", id: :serial, force: :cascade do |t|
    t.datetime "ts", default: -> { "CURRENT_TIMESTAMP" }
    t.jsonb "resource"
  end

# Could not dump table "usersession" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "usersession_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "valueset" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "valueset_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "verificationresult" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "verificationresult_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "visionprescription" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

# Could not dump table "visionprescription_history" because of following StandardError
#   Unknown type 'resource_status' for column 'status'

  add_foreign_key "items", "todos"
end
