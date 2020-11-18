# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

allergyintolerance_path = File.join(File.dirname(__FILE__), "/seeds/package/example/AllergyIntolerance-example.json")
allergyintolerance_records = JSON.parse(File.read(allergyintolerance_path))
AllResourceType.create!(
    id: allergyintolerance_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: allergyintolerance_records['resourceType'],
    status: "created",
    resource: allergyintolerance_records
)

bundle1_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Bundle-66c8856b-ba11-4876-8aa8-467aad8c11a2.json")
bundle1_records = JSON.parse(File.read(bundle1_path))
AllResourceType.create!(
    id: bundle1_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: bundle1_records['resourceType'],
    status: "created",
    resource: bundle1_records
)

bundle2_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Bundle-c887e62f-6166-419f-8268-b5ecd6c7b901.json")
bundle2_records = JSON.parse(File.read(bundle2_path))
AllResourceType.create!(
    id: bundle2_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: bundle2_records['resourceType'],
    status: "created",
    resource: bundle2_records
)

bundle3_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Bundle-uscore-mo3.json")
bundle3_records = JSON.parse(File.read(bundle3_path))
AllResourceType.create!(
    id: bundle3_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: bundle3_records['resourceType'],
    status: "created",
    resource: bundle3_records
)

careplan_path = File.join(File.dirname(__FILE__), "/seeds/package/example/CarePlan-colonoscopy.json")
careplan_records = JSON.parse(File.read(careplan_path))
AllResourceType.create!(
    id: careplan_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: careplan_records['resourceType'],
    status: "created",
    resource: careplan_records
)

careteam_path = File.join(File.dirname(__FILE__), "/seeds/package/example/CareTeam-example.json")
careteam_records = JSON.parse(File.read(careteam_path))
AllResourceType.create!(
    id: careteam_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: careteam_records['resourceType'],
    status: "created",
    resource: careteam_records
)

condition_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Condition-example.json")
condition_records = JSON.parse(File.read(condition_path))
AllResourceType.create!(
    id: condition_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: condition_records['resourceType'],
    status: "created",
    resource: condition_records
)

condition_hc1_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Condition-hc1.json")
condition_hc1_records = JSON.parse(File.read(condition_hc1_path))
AllResourceType.create!(
    id: condition_hc1_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: condition_hc1_records['resourceType'],
    status: "created",
    resource: condition_hc1_records
)

device_1_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Device-udi-1.json")
device_1_records = JSON.parse(File.read(device_1_path))
AllResourceType.create!(
    id: device_1_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: device_1_records['resourceType'],
    status: "created",
    resource: device_1_records
)

device_2_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Device-udi-2.json")
device_2_records = JSON.parse(File.read(device_2_path))
AllResourceType.create!(
    id: device_2_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: device_2_records['resourceType'],
    status: "created",
    resource: device_2_records
)

device_3_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Device-udi-3.json")
device_3_records = JSON.parse(File.read(device_3_path))
AllResourceType.create!(
    id: device_3_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: device_3_records['resourceType'],
    status: "created",
    resource: device_3_records
)

diag_1_path = File.join(File.dirname(__FILE__), "/seeds/package/example/DiagnosticReport-cardiology-report.json")
diag_1_records = JSON.parse(File.read(diag_1_path))
AllResourceType.create!(
    id: diag_1_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: diag_1_records['resourceType'],
    status: "created",
    resource: diag_1_records
)

diag_2_path = File.join(File.dirname(__FILE__), "/seeds/package/example/DiagnosticReport-cbc.json")
diag_2_records = JSON.parse(File.read(diag_2_path))
AllResourceType.create!(
    id: diag_2_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: diag_2_records['resourceType'],
    status: "created",
    resource: diag_2_records
)

diag_3_path = File.join(File.dirname(__FILE__), "/seeds/package/example/DiagnosticReport-chest-xray-report.json")
diag_3_records = JSON.parse(File.read(diag_3_path))
AllResourceType.create!(
    id: diag_3_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: diag_3_records['resourceType'],
    status: "created",
    resource: diag_3_records
)

diag_4_path = File.join(File.dirname(__FILE__), "/seeds/package/example/DiagnosticReport-metabolic-panel.json")
diag_4_records = JSON.parse(File.read(diag_4_path))
AllResourceType.create!(
    id: diag_4_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: diag_4_records['resourceType'],
    status: "created",
    resource: diag_4_records
)

diag_5_path = File.join(File.dirname(__FILE__), "/seeds/package/example/DiagnosticReport-urinalysis.json")
diag_5_records = JSON.parse(File.read(diag_5_path))
AllResourceType.create!(
    id: diag_5_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: diag_5_records['resourceType'],
    status: "created",
    resource: diag_5_records
)

doc_ref_path = File.join(File.dirname(__FILE__), "/seeds/package/example/DocumentReference-episode-summary.json")
doc_ref_records = JSON.parse(File.read(doc_ref_path))
AllResourceType.create!(
    id: doc_ref_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: doc_ref_records['resourceType'],
    status: "created",
    resource: doc_ref_records
)

encounter_1_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Encounter-1036.json")
encounter_1_records = JSON.parse(File.read(encounter_1_path))
AllResourceType.create!(
    id: encounter_1_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: encounter_1_records['resourceType'],
    status: "created",
    resource: encounter_1_records
)

encounter_2_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Encounter-example-1.json")
encounter_2_records = JSON.parse(File.read(encounter_2_path))
AllResourceType.create!(
    id: encounter_2_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: encounter_2_records['resourceType'],
    status: "created",
    resource: encounter_2_records
)

goal_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Goal-goal-1.json")
goal_records = JSON.parse(File.read(goal_path))
AllResourceType.create!(
    id: goal_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: goal_records['resourceType'],
    status: "created",
    resource: goal_records
)

imm_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Immunization-imm-1.json")
imm_records = JSON.parse(File.read(imm_path))
AllResourceType.create!(
    id: imm_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: imm_records['resourceType'],
    status: "created",
    resource: imm_records
)

location_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Location-hl7east.json")
location_records = JSON.parse(File.read(location_path))
AllResourceType.create!(
    id: location_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: location_records['resourceType'],
    status: "created",
    resource: location_records
)

medication_1_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Medication-uscore-med1.json")
medication_1_records = JSON.parse(File.read(medication_1_path))
AllResourceType.create!(
    id: medication_1_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: medication_1_records['resourceType'],
    status: "created",
    resource: medication_1_records
)

medication_2_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Medication-uscore-med2.json")
medication_2_records = JSON.parse(File.read(medication_2_path))
AllResourceType.create!(
    id: medication_2_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: medication_2_records['resourceType'],
    status: "created",
    resource: medication_2_records
)

med_request_1_path = File.join(File.dirname(__FILE__), "/seeds/package/example/MedicationRequest-self-tylenol.json")
med_request_1_records = JSON.parse(File.read(med_request_1_path))
AllResourceType.create!(
    id: med_request_1_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: med_request_1_records['resourceType'],
    status: "created",
    resource: med_request_1_records
)

med_request_2_path = File.join(File.dirname(__FILE__), "/seeds/package/example/MedicationRequest-uscore-mo1.json")
med_request_2_records = JSON.parse(File.read(med_request_2_path))
AllResourceType.create!(
    id: med_request_2_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: med_request_2_records['resourceType'],
    status: "created",
    resource: med_request_2_records
)

med_request_3_path = File.join(File.dirname(__FILE__), "/seeds/package/example/MedicationRequest-uscore-mo2.json")
med_request_3_records = JSON.parse(File.read(med_request_3_path))
AllResourceType.create!(
    id: med_request_3_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: med_request_3_records['resourceType'],
    status: "created",
    resource: med_request_3_records
)

observation_1_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-blood-glucose.json")
observation_1_records = JSON.parse(File.read(observation_1_path))
AllResourceType.create!(
    id: observation_1_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_1_records['resourceType'],
    status: "created",
    resource: observation_1_records
)

observation_2_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-blood-pressure.json")
observation_2_records = JSON.parse(File.read(observation_2_path))
AllResourceType.create!(
    id: observation_2_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_2_records['resourceType'],
    status: "created",
    resource: observation_2_records
)

observation_3_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-bmi.json")
observation_3_records = JSON.parse(File.read(observation_3_path))
AllResourceType.create!(
    id: observation_3_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_3_records['resourceType'],
    status: "created",
    resource: observation_3_records
)

observation_4_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-bp-data-absent.json")
observation_4_records = JSON.parse(File.read(observation_4_path))
AllResourceType.create!(
    id: observation_4_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_4_records['resourceType'],
    status: "created",
    resource: observation_4_records
)

observation_5_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-bun.json")
observation_5_records = JSON.parse(File.read(observation_5_path))
AllResourceType.create!(
    id: observation_5_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_5_records['resourceType'],
    status: "created",
    resource: observation_5_records
)

observation_6_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-erythrocytes.json")
observation_6_records = JSON.parse(File.read(observation_6_path))
AllResourceType.create!(
    id: observation_6_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_6_records['resourceType'],
    status: "created",
    resource: observation_6_records
)

observation_7_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-heart-rate.json")
observation_7_records = JSON.parse(File.read(observation_7_path))
AllResourceType.create!(
    id: observation_7_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_7_records['resourceType'],
    status: "created",
    resource: observation_7_records
)

observation_8_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-height.json")
observation_8_records = JSON.parse(File.read(observation_8_path))
AllResourceType.create!(
    id: observation_8_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_8_records['resourceType'],
    status: "created",
    resource: observation_8_records
)

observation_9_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-hemoglobin.json")
observation_9_records = JSON.parse(File.read(observation_9_path))
AllResourceType.create!(
    id: observation_9_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_9_records['resourceType'],
    status: "created",
    resource: observation_9_records
)

observation_10_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-length.json")
observation_10_records = JSON.parse(File.read(observation_10_path))
AllResourceType.create!(
    id: observation_10_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_10_records['resourceType'],
    status: "created",
    resource: observation_10_records
)

observation_11_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-mchc.json")
observation_11_records = JSON.parse(File.read(observation_11_path))
AllResourceType.create!(
    id: observation_11_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_11_records['resourceType'],
    status: "created",
    resource: observation_11_records
)

observation_12_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-neutrophils.json")
observation_12_records = JSON.parse(File.read(observation_12_path))
AllResourceType.create!(
    id: observation_12_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_12_records['resourceType'],
    status: "created",
    resource: observation_12_records
)

observation_13_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-ofc-percentile.json")
observation_13_records = JSON.parse(File.read(observation_13_path))
AllResourceType.create!(
    id: observation_13_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_13_records['resourceType'],
    status: "created",
    resource: observation_13_records
)

observation_14_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-oxygen-saturation.json")
observation_14_records = JSON.parse(File.read(observation_14_path))
AllResourceType.create!(
    id: observation_14_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_14_records['resourceType'],
    status: "created",
    resource: observation_14_records
)

observation_15_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-pediatric-bmi-example.json")
observation_15_records = JSON.parse(File.read(observation_15_path))
AllResourceType.create!(
    id: observation_15_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_15_records['resourceType'],
    status: "created",
    resource: observation_15_records
)

observation_16_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-pediatric-wt-example.json")
observation_16_records = JSON.parse(File.read(observation_16_path))
AllResourceType.create!(
    id: observation_16_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_16_records['resourceType'],
    status: "created",
    resource: observation_16_records
)

observation_17_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-respiratory-rate.json")
observation_17_records = JSON.parse(File.read(observation_17_path))
AllResourceType.create!(
    id: observation_17_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_17_records['resourceType'],
    status: "created",
    resource: observation_17_records
)

observation_18_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-satO2-fiO2.json")
observation_18_records = JSON.parse(File.read(observation_18_path))
AllResourceType.create!(
    id: observation_18_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_18_records['resourceType'],
    status: "created",
    resource: observation_18_records
)

observation_19_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-serum-calcium.json")
observation_19_records = JSON.parse(File.read(observation_19_path))
AllResourceType.create!(
    id: observation_19_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_19_records['resourceType'],
    status: "created",
    resource: observation_19_records
)

observation_20_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-serum-chloride.json")
observation_20_records = JSON.parse(File.read(observation_20_path))
AllResourceType.create!(
    id: observation_20_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_20_records['resourceType'],
    status: "created",
    resource: observation_20_records
)

observation_21_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-serum-co2.json")
observation_21_records = JSON.parse(File.read(observation_21_path))
AllResourceType.create!(
    id: observation_21_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_21_records['resourceType'],
    status: "created",
    resource: observation_21_records
)

observation_22_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-serum-creatinine.json")
observation_22_records = JSON.parse(File.read(observation_22_path))
AllResourceType.create!(
    id: observation_22_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_22_records['resourceType'],
    status: "created",
    resource: observation_22_records
)

observation_23_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-serum-potassium.json")
observation_23_records = JSON.parse(File.read(observation_23_path))
AllResourceType.create!(
    id: observation_23_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_23_records['resourceType'],
    status: "created",
    resource: observation_23_records
)

observation_24_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-serum-sodium.json")
observation_24_records = JSON.parse(File.read(observation_24_path))
AllResourceType.create!(
    id: observation_24_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_24_records['resourceType'],
    status: "created",
    resource: observation_24_records
)

observation_25_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-serum-total-bilirubin.json")
observation_25_records = JSON.parse(File.read(observation_25_path))
AllResourceType.create!(
    id: observation_25_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_25_records['resourceType'],
    status: "created",
    resource: observation_25_records
)

observation_26_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-some-day-smoker.json")
observation_26_records = JSON.parse(File.read(observation_26_path))
AllResourceType.create!(
    id: observation_26_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_26_records['resourceType'],
    status: "created",
    resource: observation_26_records
)

observation_27_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-temperature.json")
observation_27_records = JSON.parse(File.read(observation_27_path))
AllResourceType.create!(
    id: observation_27_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_27_records['resourceType'],
    status: "created",
    resource: observation_27_records
)

observation_28_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-bacteria.json")
observation_28_records = JSON.parse(File.read(observation_28_path))
AllResourceType.create!(
    id: observation_28_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_28_records['resourceType'],
    status: "created",
    resource: observation_28_records
)

observation_29_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-bilirubin.json")
observation_29_records = JSON.parse(File.read(observation_29_path))
AllResourceType.create!(
    id: observation_29_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_29_records['resourceType'],
    status: "created",
    resource: observation_29_records
)

observation_30_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-cells.json")
observation_30_records = JSON.parse(File.read(observation_30_path))
AllResourceType.create!(
    id: observation_30_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_30_records['resourceType'],
    status: "created",
    resource: observation_30_records
)

observation_31_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-clarity.json")
observation_31_records = JSON.parse(File.read(observation_31_path))
AllResourceType.create!(
    id: observation_31_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_31_records['resourceType'],
    status: "created",
    resource: observation_31_records
)

observation_32_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-color.json")
observation_32_records = JSON.parse(File.read(observation_32_path))
AllResourceType.create!(
    id: observation_32_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_32_records['resourceType'],
    status: "created",
    resource: observation_32_records
)

observation_33_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-epi-cells.json")
observation_33_records = JSON.parse(File.read(observation_33_path))
AllResourceType.create!(
    id: observation_33_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_33_records['resourceType'],
    status: "created",
    resource: observation_33_records
)

observation_34_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-glucose.json")
observation_34_records = JSON.parse(File.read(observation_34_path))
AllResourceType.create!(
    id: observation_34_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_34_records['resourceType'],
    status: "created",
    resource: observation_34_records
)

observation_35_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-hemoglobin.json")
observation_35_records = JSON.parse(File.read(observation_35_path))
AllResourceType.create!(
    id: observation_35_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_35_records['resourceType'],
    status: "created",
    resource: observation_35_records
)

observation_36_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-ketone.json")
observation_36_records = JSON.parse(File.read(observation_36_path))
AllResourceType.create!(
    id: observation_36_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_36_records['resourceType'],
    status: "created",
    resource: observation_36_records
)

observation_37_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-leukocyte-esterase.json")
observation_37_records = JSON.parse(File.read(observation_37_path))
AllResourceType.create!(
    id: observation_37_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_37_records['resourceType'],
    status: "created",
    resource: observation_37_records
)

observation_38_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-nitrite.json")
observation_38_records = JSON.parse(File.read(observation_38_path))
AllResourceType.create!(
    id: observation_38_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_38_records['resourceType'],
    status: "created",
    resource: observation_38_records
)

observation_39_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-ph.json")
observation_39_records = JSON.parse(File.read(observation_39_path))
AllResourceType.create!(
    id: observation_39_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_39_records['resourceType'],
    status: "created",
    resource: observation_39_records
)

observation_40_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-protein.json")
observation_40_records = JSON.parse(File.read(observation_40_path))
AllResourceType.create!(
    id: observation_40_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_40_records['resourceType'],
    status: "created",
    resource: observation_40_records
)

observation_41_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-rbcs.json")
observation_41_records = JSON.parse(File.read(observation_41_path))
AllResourceType.create!(
    id: observation_41_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_41_records['resourceType'],
    status: "created",
    resource: observation_41_records
)

observation_42_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-sediment.json")
observation_42_records = JSON.parse(File.read(observation_42_path))
AllResourceType.create!(
    id: observation_42_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_42_records['resourceType'],
    status: "created",
    resource: observation_42_records
)

observation_43_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urine-wbcs.json")
observation_43_records = JSON.parse(File.read(observation_43_path))
AllResourceType.create!(
    id: observation_43_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_43_records['resourceType'],
    status: "created",
    resource: observation_43_records
)

observation_44_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-urobilinogen.json")
observation_44_records = JSON.parse(File.read(observation_44_path))
AllResourceType.create!(
    id: observation_44_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_44_records['resourceType'],
    status: "created",
    resource: observation_44_records
)

observation_45_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-usg.json")
observation_45_records = JSON.parse(File.read(observation_45_path))
AllResourceType.create!(
    id: observation_45_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_45_records['resourceType'],
    status: "created",
    resource: observation_45_records
)

observation_46_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-vitals-panel.json")
observation_46_records = JSON.parse(File.read(observation_46_path))
AllResourceType.create!(
    id: observation_46_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_46_records['resourceType'],
    status: "created",
    resource: observation_46_records
)

observation_47_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Observation-weight.json")
observation_47_records = JSON.parse(File.read(observation_47_path))
AllResourceType.create!(
    id: observation_47_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: observation_47_records['resourceType'],
    status: "created",
    resource: observation_47_records
)

organization_1_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Organization-acme-lab.json")
organization_1_records = JSON.parse(File.read(organization_1_path))
AllResourceType.create!(
    id: organization_1_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: organization_1_records['resourceType'],
    status: "created",
    resource: organization_1_records
)

organization_2_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Organization-example-organization-2.json")
organization_2_records = JSON.parse(File.read(organization_2_path))
AllResourceType.create!(
    id: organization_2_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: organization_2_records['resourceType'],
    status: "created",
    resource: organization_2_records
)

organization_3_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Organization-saint-luke-w-endpoint.json")
organization_3_records = JSON.parse(File.read(organization_3_path))
AllResourceType.create!(
    id: organization_3_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: organization_3_records['resourceType'],
    status: "created",
    resource: organization_3_records
)

patient_1_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Patient-child-example.json")
patient_1_records = JSON.parse(File.read(patient_1_path))
AllResourceType.create!(
    id: patient_1_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: patient_1_records['resourceType'],
    status: "created",
    resource: patient_1_records
)

patient_2_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Patient-example.json")
patient_2_records = JSON.parse(File.read(patient_2_path))
AllResourceType.create!(
    id: patient_2_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: patient_2_records['resourceType'],
    status: "created",
    resource: patient_2_records
)

patient_3_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Patient-infant-example.json")
patient_3_records = JSON.parse(File.read(patient_3_path))
AllResourceType.create!(
    id: patient_3_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: patient_3_records['resourceType'],
    status: "created",
    resource: patient_3_records
)

practitioner_1_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Practitioner-practitioner-1.json")
practitioner_1_records = JSON.parse(File.read(practitioner_1_path))
AllResourceType.create!(
    id: practitioner_1_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: practitioner_1_records['resourceType'],
    status: "created",
    resource: practitioner_1_records
)

practitioner_2_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Practitioner-practitioner-2.json")
practitioner_2_records = JSON.parse(File.read(practitioner_2_path))
AllResourceType.create!(
    id: practitioner_2_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: practitioner_2_records['resourceType'],
    status: "created",
    resource: practitioner_2_records
)

procedure_1_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Procedure-defib-implant.json")
procedure_1_records = JSON.parse(File.read(procedure_1_path))
AllResourceType.create!(
    id: procedure_1_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: procedure_1_records['resourceType'],
    status: "created",
    resource: procedure_1_records
)

procedure_2_path = File.join(File.dirname(__FILE__), "/seeds/package/example/Procedure-rehab.json")
procedure_2_records = JSON.parse(File.read(procedure_2_path))
AllResourceType.create!(
    id: procedure_2_records['id'],
    txid: 0,
    ts: DateTime.now,
    resource_type: procedure_2_records['resourceType'],
    status: "created",
    resource: procedure_2_records
)


