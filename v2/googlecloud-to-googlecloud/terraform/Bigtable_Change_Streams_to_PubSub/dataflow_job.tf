

# Autogenerated file. DO NOT EDIT.
#
# Copyright (C) 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.
#


variable "on_delete" {
  type        = string
  description = "One of \"drain\" or \"cancel\". Specifies behavior of deletion during terraform destroy."
}

variable "project" {
  type        = string
  description = "The Google Cloud Project ID within which this module provisions resources."
}

variable "region" {
  type        = string
  description = "The region in which the created job should run."
}

variable "pubSubTopic" {
  type = string
  description = "The Pub/Sub topic to publish changelog entry messages."
}

variable "messageEncoding" {
  type = string
  description = "The format of the message to be written into PubSub. Allowed formats are BINARY and JSON. If topic has no encoding configured, default value is JSON."
  default = "JSON"
}

variable "messageFormat" {
  type = string
  description = "The message format chosen for outputting data to PubSub. Allowed formats are AVRO, PROTOCOL_BUFFERS and JSON. If topic has no schema configured, defaults to JSON."
  default = "JSON"
}

variable "stripValues" {
  type = bool
  description = "Strip values for SetCell mutation. If true the SetCell mutation message won’t include the values written. Defaults to: false."
  default = false
}

variable "dlqDirectory" {
  type = string
  description = "The file path to store any unprocessed records with the reason they failed to be processed. Default is a directory under the Dataflow job's temp location. The default value is enough under most conditions."
  default = ""
}

variable "dlqRetryMinutes" {
  type = number
  description = "The number of minutes between dead letter queue retries. Defaults to 10."
  default = 10
}

variable "dlqMaxRetries" {
  type = number
  description = "The number of attempts to process change stream mutations. Defaults to 5."
  default = 5
}

variable "useBase64Rowkeys" {
  type = bool
  description = "Only supported for the JSON messageFormat. When set to true, row keys will be written as Base64-encoded strings. Otherwise bigtableChangeStreamCharset charset will be used to decode binary values into String row keysDefaults to false."
  default = false
}

variable "pubSubProjectId" {
  type = string
  description = "The PubSub Project. Default is the project for the Dataflow job."
  default = ""
}

variable "useBase64ColumnQualifiers" {
  type = bool
  description = "Only supported for the JSON messageFormat. When set to true, column qualifiers will be written as Base64-encoded strings. Otherwise bigtableChangeStreamCharset charset will be used to decode binary values into String column qualifiersDefaults to false."
  default = false
}

variable "useBase64Values" {
  type = bool
  description = "Only supported for the JSON messageFormat. When set to true, values will be written as Base64-encoded strings. Otherwise bigtableChangeStreamCharset charset will be used to decode binary values into String valuesDefaults to false."
  default = false
}

variable "disableDlqRetries" {
  type = bool
  description = "Whether or not to disable retries for the DLQ. Defaults to: false."
  default = false
}

variable "bigtableChangeStreamMetadataInstanceId" {
  type = string
  description = "The Cloud Bigtable instance to use for the change streams connector metadata table. Defaults to empty."
  default = ""
}

variable "bigtableChangeStreamMetadataTableTableId" {
  type = string
  description = "The Cloud Bigtable change streams connector metadata table ID to use. If not provided, a Cloud Bigtable change streams connector metadata table will automatically be created during the pipeline flow. Defaults to empty."
  default = ""
}

variable "bigtableChangeStreamAppProfile" {
  type = string
  description = "The application profile is used to distinguish workload in Cloud Bigtable"
}

variable "bigtableChangeStreamCharset" {
  type = string
  description = "Bigtable change streams charset name when reading values and column qualifiers. Default is UTF-8"
  default = "UTF-8"
}

variable "bigtableChangeStreamStartTimestamp" {
  type = string
  description = "The starting DateTime, inclusive, to use for reading change streams (https://tools.ietf.org/html/rfc3339). For example, 2022-05-05T07:59:59Z. Defaults to the timestamp when the pipeline starts."
  default = ""
}

variable "bigtableChangeStreamIgnoreColumnFamilies" {
  type = string
  description = "A comma-separated list of column family names changes to which won't be captured. Defaults to empty."
  default = ""
}

variable "bigtableChangeStreamIgnoreColumns" {
  type = string
  description = "A comma-separated list of column names changes to which won't be captured. Defaults to empty."
  default = ""
}

variable "bigtableChangeStreamName" {
  type = string
  description = "Allows to resume processing from the point where a previously running pipeline stopped"
  default = ""
}

variable "bigtableChangeStreamResume" {
  type = bool
  description = "When set to true< a new pipeline will resume processing from the point at which a previously running pipeline with the same bigtableChangeStreamName stopped. If pipeline with the given bigtableChangeStreamName never ran in the past, a new pipeline will fail to start. When set to false a new pipeline will be started. If pipeline with the same bigtableChangeStreamName already ran in the past for the given source, a new pipeline will fail to start. Defaults to false"
  default = false
}

variable "bigtableReadInstanceId" {
  type = string
  description = "The ID of the Cloud Bigtable instance that contains the table"
}

variable "bigtableReadTableId" {
  type = string
  description = "The Cloud Bigtable table to read from."
}

variable "bigtableReadProjectId" {
  type = string
  description = "Project to read Cloud Bigtable data from. The default for this parameter is the project where the Dataflow pipeline is running."
  default = ""
}


provider "google-beta" {
    project = var.project
}

variable "additional_experiments" {
	type = set(string)
	description = "List of experiments that should be used by the job. An example value is  'enable_stackdriver_agent_metrics'."
	default = null
}

variable "autoscaling_algorithm" {
	type = string
	description = "The algorithm to use for autoscaling"
	default = null
}

variable "enable_streaming_engine" {
	type = bool
	description = "Indicates if the job should use the streaming engine feature."
	default = null
}

variable "ip_configuration" {
	type = string
	description = "The configuration for VM IPs. Options are 'WORKER_IP_PUBLIC' or 'WORKER_IP_PRIVATE'."
	default = null
}

variable "kms_key_name" {
	type = string
	description = "The name for the Cloud KMS key for the job. Key format is: projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY"
	default = null
}

variable "labels" {
	type = map(string)
	description = "User labels to be specified for the job. Keys and values should follow the restrictions specified in the labeling restrictions page. NOTE: This field is non-authoritative, and will only manage the labels present in your configuration.				Please refer to the field 'effective_labels' for all of the labels present on the resource."
	default = null
}

variable "launcher_machine_type" {
	type = string
	description = "The machine type to use for launching the job. The default is n1-standard-1."
	default = null
}

variable "machine_type" {
	type = string
	description = "The machine type to use for the job."
	default = null
}

variable "max_workers" {
	type = number
	description = "The maximum number of Google Compute Engine instances to be made available to your pipeline during execution, from 1 to 1000."
	default = null
}

variable "name" {
	type = string
}

variable "network" {
	type = string
	description = "The network to which VMs will be assigned. If it is not provided, 'default' will be used."
	default = null
}

variable "num_workers" {
	type = number
	description = "The initial number of Google Compute Engine instances for the job."
	default = null
}

variable "sdk_container_image" {
	type = string
	description = "Docker registry location of container image to use for the 'worker harness. Default is the container for the version of the SDK. Note this field is only valid for portable pipelines."
	default = null
}

variable "service_account_email" {
	type = string
	description = "The Service Account email used to create the job."
	default = null
}

variable "skip_wait_on_job_termination" {
	type = bool
	description = "If true, treat DRAINING and CANCELLING as terminal job states and do not wait for further changes before removing from terraform state and moving on. WARNING: this will lead to job name conflicts if you do not ensure that the job names are different, e.g. by embedding a release ID or by using a random_id."
	default = null
}

variable "staging_location" {
	type = string
	description = "The Cloud Storage path to use for staging files. Must be a valid Cloud Storage URL, beginning with gs://."
	default = null
}

variable "subnetwork" {
	type = string
	description = "The subnetwork to which VMs will be assigned. Should be of the form 'regions/REGION/subnetworks/SUBNETWORK'."
	default = null
}

variable "temp_location" {
	type = string
	description = "The Cloud Storage path to use for temporary files. Must be a valid Cloud Storage URL, beginning with gs://."
	default = null
}

resource "google_dataflow_flex_template_job" "generated" {
    container_spec_gcs_path = "gs://dataflow-templates-${var.region}/latest/flex/Bigtable_Change_Streams_to_PubSub"
    parameters = {
        pubSubTopic = var.pubSubTopic
        messageEncoding = var.messageEncoding
        messageFormat = var.messageFormat
        stripValues = tostring(var.stripValues)
        dlqDirectory = var.dlqDirectory
        dlqRetryMinutes = tostring(var.dlqRetryMinutes)
        dlqMaxRetries = tostring(var.dlqMaxRetries)
        useBase64Rowkeys = tostring(var.useBase64Rowkeys)
        pubSubProjectId = var.pubSubProjectId
        useBase64ColumnQualifiers = tostring(var.useBase64ColumnQualifiers)
        useBase64Values = tostring(var.useBase64Values)
        disableDlqRetries = tostring(var.disableDlqRetries)
        bigtableChangeStreamMetadataInstanceId = var.bigtableChangeStreamMetadataInstanceId
        bigtableChangeStreamMetadataTableTableId = var.bigtableChangeStreamMetadataTableTableId
        bigtableChangeStreamAppProfile = var.bigtableChangeStreamAppProfile
        bigtableChangeStreamCharset = var.bigtableChangeStreamCharset
        bigtableChangeStreamStartTimestamp = var.bigtableChangeStreamStartTimestamp
        bigtableChangeStreamIgnoreColumnFamilies = var.bigtableChangeStreamIgnoreColumnFamilies
        bigtableChangeStreamIgnoreColumns = var.bigtableChangeStreamIgnoreColumns
        bigtableChangeStreamName = var.bigtableChangeStreamName
        bigtableChangeStreamResume = tostring(var.bigtableChangeStreamResume)
        bigtableReadInstanceId = var.bigtableReadInstanceId
        bigtableReadTableId = var.bigtableReadTableId
        bigtableReadProjectId = var.bigtableReadProjectId
    }
    
	additional_experiments = var.additional_experiments
	autoscaling_algorithm = var.autoscaling_algorithm
	enable_streaming_engine = var.enable_streaming_engine
	ip_configuration = var.ip_configuration
	kms_key_name = var.kms_key_name
	labels = var.labels
	launcher_machine_type = var.launcher_machine_type
	machine_type = var.machine_type
	max_workers = var.max_workers
	name = var.name
	network = var.network
	num_workers = var.num_workers
	sdk_container_image = var.sdk_container_image
	service_account_email = var.service_account_email
	skip_wait_on_job_termination = var.skip_wait_on_job_termination
	staging_location = var.staging_location
	subnetwork = var.subnetwork
	temp_location = var.temp_location
}

