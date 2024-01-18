

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

variable "spannerProjectId" {
  type = string
  description = "Project to read change streams from. The default for this parameter is the project where the Dataflow pipeline is running."
  default = ""
}

variable "spannerInstanceId" {
  type = string
  description = "The Spanner instance to read change streams from."
}

variable "spannerDatabase" {
  type = string
  description = "The Spanner database to read change streams from."
}

variable "spannerDatabaseRole" {
  type = string
  description = "Database role user assumes while reading from the change stream. The database role should have required privileges to read from change stream. If a database role is not specified, the user should have required IAM permissions to read from the database."
  default = ""
}

variable "spannerMetadataInstanceId" {
  type = string
  description = "The Spanner instance to use for the change streams connector metadata table."
}

variable "spannerMetadataDatabase" {
  type = string
  description = "The Spanner database to use for the change streams connector metadata table. For change streams tracking all tables in a database, we recommend putting the metadata table in a separate database."
}

variable "spannerMetadataTableName" {
  type = string
  description = "The Cloud Spanner change streams connector metadata table name to use. If not provided, a Cloud Spanner change streams connector metadata table will automatically be created during the pipeline flow. This parameter must be provided when updating an existing pipeline and should not be provided otherwise."
  default = ""
}

variable "spannerChangeStreamName" {
  type = string
  description = "The name of the Spanner change stream to read from."
}

variable "rpcPriority" {
  type = string
  description = "The request priority for Cloud Spanner calls. The value must be one of: [HIGH,MEDIUM,LOW]. Defaults to: HIGH."
  default = "HIGH"
}

variable "spannerHost" {
  type = string
  description = "The Cloud Spanner endpoint to call in the template. Only used for testing. (Example: https://batch-spanner.googleapis.com)"
  default = ""
}

variable "startTimestamp" {
  type = string
  description = "The starting DateTime, inclusive, to use for reading change streams (https://tools.ietf.org/html/rfc3339). For example, 2022-05-05T07:59:59Z. Defaults to the timestamp when the pipeline starts."
  default = ""
}

variable "endTimestamp" {
  type = string
  description = "The ending DateTime, inclusive, to use for reading change streams (https://tools.ietf.org/html/rfc3339). Ex-2022-05-05T07:59:59Z. Defaults to an infinite time in the future."
  default = ""
}

variable "bigQueryDataset" {
  type = string
  description = "The BigQuery dataset for change streams output. Both the dataSetName and the full dataSetId (i.e. bigQueryProjectId.dataSetName) are acceptable."
}

variable "bigQueryProjectId" {
  type = string
  description = "The BigQuery Project. Default is the project for the Dataflow job."
  default = ""
}

variable "bigQueryChangelogTableNameTemplate" {
  type = string
  description = "The Template for the BigQuery table name that contains the change log. Defaults to: {_metadata_spanner_table_name}_changelog."
  default = "{_metadata_spanner_table_name}_changelog"
}

variable "deadLetterQueueDirectory" {
  type = string
  description = "The file path to store any unprocessed records with the reason they failed to be processed. Default is a directory under the Dataflow job's temp location. The default value is enough under most conditions."
  default = ""
}

variable "dlqRetryMinutes" {
  type = number
  description = "The number of minutes between dead letter queue retries. Defaults to 10."
  default = 10
}

variable "ignoreFields" {
  type = string
  description = "Comma separated list of fields to be ignored, these could be fields of tracked tables, or metadata fields which are _metadata_spanner_mod_type, _metadata_spanner_table_name, _metadata_spanner_commit_timestamp, _metadata_spanner_server_transaction_id, _metadata_spanner_record_sequence, _metadata_spanner_is_last_record_in_transaction_in_partition, _metadata_spanner_number_of_records_in_transaction, _metadata_spanner_number_of_partitions_in_transaction, _metadata_big_query_commit_timestamp. Defaults to empty."
  default = ""
}

variable "disableDlqRetries" {
  type = bool
  description = "Whether or not to disable retries for the DLQ. Defaults to: false."
  default = false
}

variable "useStorageWriteApi" {
  type = bool
  description = "If enabled (set to true) the pipeline will use Storage Write API when writing the data to BigQuery (see https://cloud.google.com/blog/products/data-analytics/streaming-data-into-bigquery-using-storage-write-api). If this is enabled and at-least-once semantics (useStorageWriteApiAtLeastOnce) option is off then "Number of streams for BigQuery Storage Write API" and "Triggering frequency in seconds for BigQuery Storage Write API" must be provided. Defaults to: false."
  default = false
}

variable "useStorageWriteApiAtLeastOnce" {
  type = bool
  description = "This parameter takes effect only if "Use BigQuery Storage Write API" is enabled. If enabled the at-least-once semantics will be used for Storage Write API, otherwise exactly-once semantics will be used. Defaults to: false."
  default = false
}

variable "numStorageWriteApiStreams" {
  type = number
  description = "Number of streams defines the parallelism of the BigQueryIO’s Write transform and roughly corresponds to the number of Storage Write API’s streams which will be used by the pipeline. See https://cloud.google.com/blog/products/data-analytics/streaming-data-into-bigquery-using-storage-write-api for the recommended values. Defaults to: 0."
  default = 0
}

variable "storageWriteApiTriggeringFrequencySec" {
  type = number
  description = "Triggering frequency will determine how soon the data will be visible for querying in BigQuery. See https://cloud.google.com/blog/products/data-analytics/streaming-data-into-bigquery-using-storage-write-api for the recommended values."
  default = 
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
    container_spec_gcs_path = "gs://dataflow-templates-${var.region}/latest/flex/Spanner_Change_Streams_to_BigQuery"
    parameters = {
        spannerProjectId = var.spannerProjectId
        spannerInstanceId = var.spannerInstanceId
        spannerDatabase = var.spannerDatabase
        spannerDatabaseRole = var.spannerDatabaseRole
        spannerMetadataInstanceId = var.spannerMetadataInstanceId
        spannerMetadataDatabase = var.spannerMetadataDatabase
        spannerMetadataTableName = var.spannerMetadataTableName
        spannerChangeStreamName = var.spannerChangeStreamName
        rpcPriority = var.rpcPriority
        spannerHost = var.spannerHost
        startTimestamp = var.startTimestamp
        endTimestamp = var.endTimestamp
        bigQueryDataset = var.bigQueryDataset
        bigQueryProjectId = var.bigQueryProjectId
        bigQueryChangelogTableNameTemplate = var.bigQueryChangelogTableNameTemplate
        deadLetterQueueDirectory = var.deadLetterQueueDirectory
        dlqRetryMinutes = tostring(var.dlqRetryMinutes)
        ignoreFields = var.ignoreFields
        disableDlqRetries = tostring(var.disableDlqRetries)
        useStorageWriteApi = tostring(var.useStorageWriteApi)
        useStorageWriteApiAtLeastOnce = tostring(var.useStorageWriteApiAtLeastOnce)
        numStorageWriteApiStreams = tostring(var.numStorageWriteApiStreams)
        storageWriteApiTriggeringFrequencySec = tostring(var.storageWriteApiTriggeringFrequencySec)
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

