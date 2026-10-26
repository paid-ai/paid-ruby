# frozen_string_literal: true

require "json"
require "net/http"
require "securerandom"
require "time"

require_relative "paid/internal/json/serializable"
require_relative "paid/internal/types/type"
require_relative "paid/internal/types/utils"
require_relative "paid/internal/types/union"
require_relative "paid/internal/errors/constraint_error"
require_relative "paid/internal/errors/type_error"
require_relative "paid/internal/http/base_request"
require_relative "paid/internal/json/request"
require_relative "paid/internal/http/raw_client"
require_relative "paid/internal/multipart/multipart_encoder"
require_relative "paid/internal/multipart/multipart_form_data_part"
require_relative "paid/internal/multipart/multipart_form_data"
require_relative "paid/internal/multipart/multipart_request"
require_relative "paid/internal/types/model/field"
require_relative "paid/internal/types/model"
require_relative "paid/internal/types/array"
require_relative "paid/internal/types/boolean"
require_relative "paid/internal/types/enum"
require_relative "paid/internal/types/hash"
require_relative "paid/internal/types/unknown"
require_relative "paid/errors/api_error"
require_relative "paid/errors/response_error"
require_relative "paid/errors/client_error"
require_relative "paid/errors/redirect_error"
require_relative "paid/errors/server_error"
require_relative "paid/errors/timeout_error"
require_relative "paid/internal/iterators/item_iterator"
require_relative "paid/internal/iterators/cursor_item_iterator"
require_relative "paid/internal/iterators/offset_item_iterator"
require_relative "paid/internal/iterators/cursor_page_iterator"
require_relative "paid/internal/iterators/offset_page_iterator"
require_relative "paid/errors/connection_error"
require_relative "paid/client"
require_relative "paid/products/client"
require_relative "paid/products/types/list_products_request"
require_relative "paid/products/types/create_product_request"
require_relative "paid/products/types/get_product_by_id_request"
require_relative "paid/products/types/update_product_by_id_request"
require_relative "paid/products/types/get_product_by_external_id_request"
require_relative "paid/products/types/update_product_by_external_id_request"
require_relative "paid/plans/client"
require_relative "paid/plans/types/list_plans_request"
require_relative "paid/plans/types/create_plan_request"
require_relative "paid/plans/types/update_plan_upgrade_path_request"
require_relative "paid/plans/types/get_plan_by_id_request"
require_relative "paid/plans/types/update_plan_by_id_request"
require_relative "paid/plans/types/get_plan_by_external_id_request"
require_relative "paid/plans/types/update_plan_by_external_id_request"
require_relative "paid/customers/client"
require_relative "paid/customers/types/list_customers_request"
require_relative "paid/customers/types/create_customer_request"
require_relative "paid/customers/types/list_customer_aliases_request"
require_relative "paid/customers/types/create_customer_alias_request"
require_relative "paid/customers/types/delete_customer_alias_request"
require_relative "paid/customers/types/get_customer_by_id_request"
require_relative "paid/customers/types/update_customer_by_id_request"
require_relative "paid/customers/types/delete_customer_by_id_request"
require_relative "paid/customers/types/get_customer_state_by_id_request"
require_relative "paid/customers/types/list_customer_aliases_by_external_id_request"
require_relative "paid/customers/types/create_customer_alias_by_external_id_request"
require_relative "paid/customers/types/delete_customer_alias_by_external_id_request"
require_relative "paid/customers/types/get_customer_by_external_id_request"
require_relative "paid/customers/types/update_customer_by_external_id_request"
require_relative "paid/customers/types/delete_customer_by_external_id_request"
require_relative "paid/customers/types/get_customer_state_by_external_id_request"
require_relative "paid/customers/types/get_customer_credit_balances_request"
require_relative "paid/customers/types/grant_customer_credits_request"
require_relative "paid/customers/types/get_customer_credit_balances_by_external_id_request"
require_relative "paid/customers/types/list_customer_pending_credit_consumption_request"
require_relative "paid/customers/types/list_customer_pending_credit_consumption_by_external_id_request"
require_relative "paid/customers/types/grant_customer_credits_by_external_id_request"
require_relative "paid/customers/types/upsert_customer_user_request"
require_relative "paid/customers/types/get_customer_funding_instructions_request"
require_relative "paid/customers/types/create_customer_funding_instructions_request"
require_relative "paid/customers/types/get_customer_funding_instructions_by_external_id_request"
require_relative "paid/customers/types/create_customer_funding_instructions_by_external_id_request"
require_relative "paid/customers/types/list_customer_units_by_external_id_request"
require_relative "paid/customers/types/create_customer_unit_by_external_id_request"
require_relative "paid/customers/types/get_customer_unit_by_external_id_request"
require_relative "paid/customers/types/delete_customer_unit_by_external_id_request"
require_relative "paid/customers/types/update_customer_unit_by_external_id_request"
require_relative "paid/customers/types/list_customer_unit_aliases_by_external_id_request"
require_relative "paid/customers/types/create_customer_unit_alias_by_external_id_request"
require_relative "paid/customers/types/delete_customer_unit_alias_by_external_id_request"
require_relative "paid/customers/types/list_customer_units_request"
require_relative "paid/customers/types/create_customer_unit_request"
require_relative "paid/customers/types/get_customer_unit_request"
require_relative "paid/customers/types/delete_customer_unit_request"
require_relative "paid/customers/types/update_customer_unit_request"
require_relative "paid/customers/types/list_customer_unit_aliases_request"
require_relative "paid/customers/types/create_customer_unit_alias_request"
require_relative "paid/customers/types/delete_customer_unit_alias_request"
require_relative "paid/customers/types/get_customer_unit_by_key_request"
require_relative "paid/customers/types/list_customer_unit_aliases_by_key_request"
require_relative "paid/customers/types/create_customer_unit_alias_by_key_request"
require_relative "paid/customers/types/delete_customer_unit_alias_by_key_request"
require_relative "paid/customers/types/customer_unit_create_under_parent"
require_relative "paid/customers/types/list_customer_api_keys_by_external_id_request"
require_relative "paid/customers/types/create_customer_api_key_by_external_id_request"
require_relative "paid/customers/types/revoke_customer_api_key_by_external_id_request"
require_relative "paid/customers/types/list_customer_api_keys_request"
require_relative "paid/customers/types/create_customer_api_key_request"
require_relative "paid/customers/types/revoke_customer_api_key_request"
require_relative "paid/customers/types/get_customer_unit_cap_by_external_id_request"
require_relative "paid/customers/types/set_customer_unit_cap_by_external_id_request"
require_relative "paid/customers/types/end_customer_unit_cap_by_external_id_request"
require_relative "paid/customers/types/get_customer_unit_spend_by_external_id_request"
require_relative "paid/customers/types/get_customer_unit_cap_request"
require_relative "paid/customers/types/set_customer_unit_cap_request"
require_relative "paid/customers/types/end_customer_unit_cap_request"
require_relative "paid/customers/types/get_customer_unit_spend_request"
require_relative "paid/contacts/client"
require_relative "paid/contacts/types/list_contacts_request"
require_relative "paid/contacts/types/create_contact_request"
require_relative "paid/contacts/types/get_contact_by_id_request"
require_relative "paid/contacts/types/update_contact_by_id_request"
require_relative "paid/contacts/types/delete_contact_by_id_request"
require_relative "paid/contacts/types/get_contact_by_external_id_request"
require_relative "paid/contacts/types/update_contact_by_external_id_request"
require_relative "paid/contacts/types/delete_contact_by_external_id_request"
require_relative "paid/orders/client"
require_relative "paid/orders/types/list_orders_request"
require_relative "paid/orders/types/create_order_request"
require_relative "paid/orders/types/get_order_by_id_request"
require_relative "paid/orders/types/update_order_request"
require_relative "paid/orders/types/delete_order_by_id_request"
require_relative "paid/orders/types/activate_order_by_id_request"
require_relative "paid/orders/types/get_order_lines_request"
require_relative "paid/orders/types/list_order_seats_request"
require_relative "paid/orders/types/update_seat_assignment_request"
require_relative "paid/orders/types/batch_seat_assignments_request"
require_relative "paid/orders/types/provision_request"
require_relative "paid/invoices/client"
require_relative "paid/invoices/types/list_invoices_request"
require_relative "paid/invoices/types/get_invoice_by_id_request"
require_relative "paid/invoices/types/update_invoice_request"
require_relative "paid/invoices/types/get_invoice_lines_request"
require_relative "paid/signals/client"
require_relative "paid/signals/types/list_signals_request"
require_relative "paid/signals/types/get_signal_by_id_request"
require_relative "paid/signals/types/signal_lookup_request"
require_relative "paid/signals/types/bulk_signals_request"
require_relative "paid/signals/types/create_signal_summary_export_request"
require_relative "paid/signals/types/get_signal_summary_export_request"
require_relative "paid/signals/types/get_signal_summary_request"
require_relative "paid/credits/client"
require_relative "paid/credits/types/list_credit_currencies_request"
require_relative "paid/credits/types/create_credit_currency_request"
require_relative "paid/credits/types/list_credit_transactions_request"
require_relative "paid/credits/types/get_credit_transaction_summary_request"
require_relative "paid/credits/types/update_credit_currency_request"
require_relative "paid/checkouts/client"
require_relative "paid/checkouts/types/list_checkouts_request"
require_relative "paid/checkouts/types/create_checkout_request"
require_relative "paid/checkouts/types/get_checkout_request"
require_relative "paid/checkouts/types/archive_checkout_request"
require_relative "paid/customer_portals/client"
require_relative "paid/customer_portals/types/create_customer_portal_request"
require_relative "paid/value_receipts/client"
require_relative "paid/value_receipts/types/list_value_receipts_request"
require_relative "paid/value_receipts/types/get_value_receipt_by_id_request"
require_relative "paid/value_receipts/types/refresh_value_receipt_request"
require_relative "paid/value_receipts/types/seal_value_receipt_request"
require_relative "paid/value_receipts/types/archive_value_receipt_request"
require_relative "paid/value_receipts/types/unarchive_value_receipt_request"
require_relative "paid/value_receipts/types/publish_value_receipt_body"
require_relative "paid/value_receipts/types/unpublish_value_receipt_request"
require_relative "paid/delivered_value/client"
require_relative "paid/delivered_value/types/get_delivered_value_request"
require_relative "paid/delivered_value/types/get_delivered_value_summary_request"
require_relative "paid/webhooks/client"
require_relative "paid/webhooks/types/update_webhook_request"
require_relative "paid/webhooks/types/test_webhook_request"
require_relative "paid/webhooks/types/rotate_webhook_secret_request"
require_relative "paid/pricing/client"
require_relative "paid/pricing/types/list_pricing_request"
require_relative "paid/pricing/types/get_pricing_request"
require_relative "paid/pricing/types/update_pricing_request"
require_relative "paid/costs/client"
require_relative "paid/costs/types/cost_ingest_request"
require_relative "paid/analytics/client"
require_relative "paid/analytics/types/get_signals_metadata_request"
require_relative "paid/custom_views_experimental/client"
require_relative "paid/custom_views_experimental/types/create_custom_view_request"
require_relative "paid/custom_views_experimental/types/publish_custom_view_request"
require_relative "paid/custom_views_experimental/types/update_custom_view_period_request"
require_relative "paid/custom_views_experimental/types/get_custom_view_request"
require_relative "paid/custom_views_experimental/types/update_custom_view_request"
require_relative "paid/custom_views_experimental/types/get_custom_view_customer_units_request"
require_relative "paid/custom_views_experimental/types/get_custom_view_data_request"
require_relative "paid/custom_views_experimental/types/get_custom_view_embed_token_request"
require_relative "paid/value_models/client"
require_relative "paid/value_models/types/value_model_upload_request"
require_relative "paid/value_models/types/list_value_model_versions_request"
require_relative "paid/value_models/types/get_value_model_version_request"
require_relative "paid/value_models/types/refresh_value_model_backfill_request"
require_relative "paid/value_metrics/client"
require_relative "paid/value_metrics/types/list_value_metrics_request"
require_relative "paid/value_metrics/types/create_value_metric_request"
require_relative "paid/value_metrics/types/get_value_metric_request"
require_relative "paid/value_metrics/types/archive_value_metric_request"
require_relative "paid/value_metrics/types/update_value_metric_request"
require_relative "paid/payment_methods/client"
require_relative "paid/payment_methods/types/list_payment_methods_request"
require_relative "paid/payment_methods/types/create_payment_method_request"
require_relative "paid/payment_methods/types/get_payment_method_request"
require_relative "paid/payment_methods/types/delete_payment_method_request"
require_relative "paid/payment_methods/types/update_default_payment_method_request"
require_relative "paid/payments/client"
require_relative "paid/payments/types/list_payments_request"
require_relative "paid/payments/types/create_payment_request"
require_relative "paid/payments/types/get_payment_request"
require_relative "paid/payment_allocations/client"
require_relative "paid/payment_allocations/types/list_payment_allocations_request"
require_relative "paid/payment_allocations/types/create_payment_allocation_request"
require_relative "paid/amendments/client"
require_relative "paid/amendments/types/get_order_amendment_options_request"
require_relative "paid/amendments/types/unified_amendment_preview_request"
require_relative "paid/amendments/types/unified_amendment_execute_request"
require_relative "paid/analytics_experimental/client"
require_relative "paid/analytics_experimental/types/get_experimental_signals_metadata_request"
require_relative "paid/environment"

module Paid
  module Customers
    module Types
      autoload :ListCustomersRequestStatus, ::File.join(__dir__, "paid/customers/types/list_customers_request_status")
      autoload :ListCustomersRequestCreationState, ::File.join(__dir__, "paid/customers/types/list_customers_request_creation_state")
      autoload :ListCustomerUnitsByExternalIDRequestStatus, ::File.join(__dir__, "paid/customers/types/list_customer_units_by_external_id_request_status")
      autoload :DeleteCustomerUnitAliasByExternalIDResponse, ::File.join(__dir__, "paid/customers/types/delete_customer_unit_alias_by_external_id_response")
      autoload :ListCustomerUnitsRequestStatus, ::File.join(__dir__, "paid/customers/types/list_customer_units_request_status")
      autoload :DeleteCustomerUnitAliasResponse, ::File.join(__dir__, "paid/customers/types/delete_customer_unit_alias_response")
      autoload :DeleteCustomerUnitAliasByKeyResponse, ::File.join(__dir__, "paid/customers/types/delete_customer_unit_alias_by_key_response")
    end
  end

  module Contacts
    module Types
      autoload :CreateContactRequestRolesItem, ::File.join(__dir__, "paid/contacts/types/create_contact_request_roles_item")
    end
  end

  module Orders
    module Types
      autoload :ListOrdersRequestCreationState, ::File.join(__dir__, "paid/orders/types/list_orders_request_creation_state")
      autoload :OrderStatusFilter, ::File.join(__dir__, "paid/orders/types/order_status_filter")
      autoload :CreateOrderRequestPaymentTerms, ::File.join(__dir__, "paid/orders/types/create_order_request_payment_terms")
      autoload :UpdateOrderRequestPaymentTerms, ::File.join(__dir__, "paid/orders/types/update_order_request_payment_terms")
      autoload :ListOrderSeatsRequestStatus, ::File.join(__dir__, "paid/orders/types/list_order_seats_request_status")
      autoload :BatchSeatAssignmentsRequestAssignmentsItem, ::File.join(__dir__, "paid/orders/types/batch_seat_assignments_request_assignments_item")
    end
  end

  module Invoices
    module Types
      autoload :ListInvoicesRequestStatus, ::File.join(__dir__, "paid/invoices/types/list_invoices_request_status")
      autoload :ListInvoicesRequestPaymentStatus, ::File.join(__dir__, "paid/invoices/types/list_invoices_request_payment_status")
    end
  end

  module Signals
    module Types
      autoload :CreateSignalSummaryExportRequestFormat, ::File.join(__dir__, "paid/signals/types/create_signal_summary_export_request_format")
      autoload :GetSignalSummaryRequestInterval, ::File.join(__dir__, "paid/signals/types/get_signal_summary_request_interval")
      autoload :GetSignalSummaryRequestGroupBy, ::File.join(__dir__, "paid/signals/types/get_signal_summary_request_group_by")
    end
  end

  module Credits
    module Types
      autoload :ListCreditCurrenciesRequestStatus, ::File.join(__dir__, "paid/credits/types/list_credit_currencies_request_status")
      autoload :ListCreditTransactionsRequestType, ::File.join(__dir__, "paid/credits/types/list_credit_transactions_request_type")
      autoload :GetCreditTransactionSummaryRequestType, ::File.join(__dir__, "paid/credits/types/get_credit_transaction_summary_request_type")
      autoload :GetCreditTransactionSummaryRequestGroupBy, ::File.join(__dir__, "paid/credits/types/get_credit_transaction_summary_request_group_by")
      autoload :GetCreditTransactionSummaryRequestInterval, ::File.join(__dir__, "paid/credits/types/get_credit_transaction_summary_request_interval")
      autoload :UpdateCreditCurrencyRequestStatus, ::File.join(__dir__, "paid/credits/types/update_credit_currency_request_status")
    end
  end

  module Checkouts
    module Types
      autoload :ListCheckoutsRequestStatus, ::File.join(__dir__, "paid/checkouts/types/list_checkouts_request_status")
    end
  end

  module ValueReceipts
    module Types
      autoload :ListValueReceiptsRequestArchived, ::File.join(__dir__, "paid/value_receipts/types/list_value_receipts_request_archived")
    end
  end

  module DeliveredValue
    module Types
      autoload :GetDeliveredValueSummaryRequestGroupBy, ::File.join(__dir__, "paid/delivered_value/types/get_delivered_value_summary_request_group_by")
      autoload :GetDeliveredValueSummaryRequestInterval, ::File.join(__dir__, "paid/delivered_value/types/get_delivered_value_summary_request_interval")
    end
  end

  module Webhooks
    module Types
      autoload :UpdateWebhookRequestWebhookName, ::File.join(__dir__, "paid/webhooks/types/update_webhook_request_webhook_name")
      autoload :TestWebhookRequestWebhookName, ::File.join(__dir__, "paid/webhooks/types/test_webhook_request_webhook_name")
    end
  end

  module CustomViewsExperimental
    module Types
      autoload :CreateCustomViewRequestPeriodKind, ::File.join(__dir__, "paid/custom_views_experimental/types/create_custom_view_request_period_kind")
      autoload :CreateCustomViewRequestPeriodUnit, ::File.join(__dir__, "paid/custom_views_experimental/types/create_custom_view_request_period_unit")
      autoload :CreateCustomViewRequestPeriod, ::File.join(__dir__, "paid/custom_views_experimental/types/create_custom_view_request_period")
      autoload :CreateCustomViewRequestScope, ::File.join(__dir__, "paid/custom_views_experimental/types/create_custom_view_request_scope")
      autoload :UpdateCustomViewPeriodRequestPeriodKind, ::File.join(__dir__, "paid/custom_views_experimental/types/update_custom_view_period_request_period_kind")
      autoload :UpdateCustomViewPeriodRequestPeriodUnit, ::File.join(__dir__, "paid/custom_views_experimental/types/update_custom_view_period_request_period_unit")
      autoload :UpdateCustomViewPeriodRequestPeriod, ::File.join(__dir__, "paid/custom_views_experimental/types/update_custom_view_period_request_period")
      autoload :GetCustomViewDataRequestPeriodKind, ::File.join(__dir__, "paid/custom_views_experimental/types/get_custom_view_data_request_period_kind")
      autoload :GetCustomViewDataRequestPeriodUnit, ::File.join(__dir__, "paid/custom_views_experimental/types/get_custom_view_data_request_period_unit")
      autoload :GetCustomViewDataRequestIncludeDraft, ::File.join(__dir__, "paid/custom_views_experimental/types/get_custom_view_data_request_include_draft")
      autoload :GetCustomViewDataRequestUnitMode, ::File.join(__dir__, "paid/custom_views_experimental/types/get_custom_view_data_request_unit_mode")
    end
  end

  module ValueMetrics
    module Types
      autoload :CreateValueMetricRequestCategory, ::File.join(__dir__, "paid/value_metrics/types/create_value_metric_request_category")
      autoload :CreateValueMetricRequestSourcesItem, ::File.join(__dir__, "paid/value_metrics/types/create_value_metric_request_sources_item")
      autoload :UpdateValueMetricRequestCategory, ::File.join(__dir__, "paid/value_metrics/types/update_value_metric_request_category")
      autoload :UpdateValueMetricRequestSourcesItem, ::File.join(__dir__, "paid/value_metrics/types/update_value_metric_request_sources_item")
    end
  end

  module Payments
    module Types
      autoload :ListPaymentsRequestStatus, ::File.join(__dir__, "paid/payments/types/list_payments_request_status")
    end
  end

  module Amendments
    module Types
      autoload :UnifiedAmendmentPreviewRequestDefaultTreatment, ::File.join(__dir__, "paid/amendments/types/unified_amendment_preview_request_default_treatment")
      autoload :UnifiedAmendmentExecuteRequestDefaultTreatment, ::File.join(__dir__, "paid/amendments/types/unified_amendment_execute_request_default_treatment")
    end
  end

  module Types
    autoload :Product, ::File.join(__dir__, "paid/types/product")
    autoload :ErrorResponse, ::File.join(__dir__, "paid/types/error_response")
    autoload :Pagination, ::File.join(__dir__, "paid/types/pagination")
    autoload :ProductListResponse, ::File.join(__dir__, "paid/types/product_list_response")
    autoload :ProductPricingTierOutputTierBillingType, ::File.join(__dir__, "paid/types/product_pricing_tier_output_tier_billing_type")
    autoload :ProductPricingTierOutput, ::File.join(__dir__, "paid/types/product_pricing_tier_output")
    autoload :ProductPricePointOutput, ::File.join(__dir__, "paid/types/product_price_point_output")
    autoload :ProductPricingOutputPricingType, ::File.join(__dir__, "paid/types/product_pricing_output_pricing_type")
    autoload :ProductPricingOutputSignalType, ::File.join(__dir__, "paid/types/product_pricing_output_signal_type")
    autoload :ProductPricingOutput, ::File.join(__dir__, "paid/types/product_pricing_output")
    autoload :ProductCreditBenefitOutput, ::File.join(__dir__, "paid/types/product_credit_benefit_output")
    autoload :ProductAttributeOutput, ::File.join(__dir__, "paid/types/product_attribute_output")
    autoload :ProductDetail, ::File.join(__dir__, "paid/types/product_detail")
    autoload :ProductSimplePricePointTiersItemTierBillingType, ::File.join(__dir__, "paid/types/product_simple_price_point_tiers_item_tier_billing_type")
    autoload :ProductSimplePricePointTiersItem, ::File.join(__dir__, "paid/types/product_simple_price_point_tiers_item")
    autoload :ProductSimplePricePoint, ::File.join(__dir__, "paid/types/product_simple_price_point")
    autoload :ProductRecurringPerUnitInputBillingFrequency, ::File.join(__dir__, "paid/types/product_recurring_per_unit_input_billing_frequency")
    autoload :ProductRecurringPerUnitInputBillingType, ::File.join(__dir__, "paid/types/product_recurring_per_unit_input_billing_type")
    autoload :ProductRecurringPerUnitInput, ::File.join(__dir__, "paid/types/product_recurring_per_unit_input")
    autoload :ProductTieredPricePointTiersItemTierBillingType, ::File.join(__dir__, "paid/types/product_tiered_price_point_tiers_item_tier_billing_type")
    autoload :ProductTieredPricePointTiersItem, ::File.join(__dir__, "paid/types/product_tiered_price_point_tiers_item")
    autoload :ProductTieredPricePoint, ::File.join(__dir__, "paid/types/product_tiered_price_point")
    autoload :ProductRecurringGraduatedInputBillingFrequency, ::File.join(__dir__, "paid/types/product_recurring_graduated_input_billing_frequency")
    autoload :ProductRecurringGraduatedInputBillingType, ::File.join(__dir__, "paid/types/product_recurring_graduated_input_billing_type")
    autoload :ProductRecurringGraduatedInput, ::File.join(__dir__, "paid/types/product_recurring_graduated_input")
    autoload :ProductRecurringVolumeInputBillingFrequency, ::File.join(__dir__, "paid/types/product_recurring_volume_input_billing_frequency")
    autoload :ProductRecurringVolumeInputBillingType, ::File.join(__dir__, "paid/types/product_recurring_volume_input_billing_type")
    autoload :ProductRecurringVolumeInput, ::File.join(__dir__, "paid/types/product_recurring_volume_input")
    autoload :ProductRecurringPercentOfTotalInputBillingFrequency, ::File.join(__dir__, "paid/types/product_recurring_percent_of_total_input_billing_frequency")
    autoload :ProductRecurringPercentOfTotalInputBillingType, ::File.join(__dir__, "paid/types/product_recurring_percent_of_total_input_billing_type")
    autoload :ProductRecurringPercentOfTotalInput, ::File.join(__dir__, "paid/types/product_recurring_percent_of_total_input")
    autoload :ProductUsagePerUnitInputSignalType, ::File.join(__dir__, "paid/types/product_usage_per_unit_input_signal_type")
    autoload :ProductUsagePerUnitInputBillingFrequency, ::File.join(__dir__, "paid/types/product_usage_per_unit_input_billing_frequency")
    autoload :ProductUsagePerUnitInputBillingType, ::File.join(__dir__, "paid/types/product_usage_per_unit_input_billing_type")
    autoload :ProductUsagePerUnitInput, ::File.join(__dir__, "paid/types/product_usage_per_unit_input")
    autoload :ProductUsageGraduatedInputSignalType, ::File.join(__dir__, "paid/types/product_usage_graduated_input_signal_type")
    autoload :ProductUsageGraduatedInputBillingFrequency, ::File.join(__dir__, "paid/types/product_usage_graduated_input_billing_frequency")
    autoload :ProductUsageGraduatedInputBillingType, ::File.join(__dir__, "paid/types/product_usage_graduated_input_billing_type")
    autoload :ProductUsageGraduatedInput, ::File.join(__dir__, "paid/types/product_usage_graduated_input")
    autoload :ProductUsageVolumeInputSignalType, ::File.join(__dir__, "paid/types/product_usage_volume_input_signal_type")
    autoload :ProductUsageVolumeInputBillingFrequency, ::File.join(__dir__, "paid/types/product_usage_volume_input_billing_frequency")
    autoload :ProductUsageVolumeInputBillingType, ::File.join(__dir__, "paid/types/product_usage_volume_input_billing_type")
    autoload :ProductUsageVolumeInput, ::File.join(__dir__, "paid/types/product_usage_volume_input")
    autoload :ProductUsagePrepaidCreditsInputSignalType, ::File.join(__dir__, "paid/types/product_usage_prepaid_credits_input_signal_type")
    autoload :ProductUsagePrepaidCreditsInputPricingInputKind, ::File.join(__dir__, "paid/types/product_usage_prepaid_credits_input_pricing_input_kind")
    autoload :ProductUsagePrepaidCreditsInputPricingInput, ::File.join(__dir__, "paid/types/product_usage_prepaid_credits_input_pricing_input")
    autoload :ProductUsagePrepaidCreditsInputBillingFrequency, ::File.join(__dir__, "paid/types/product_usage_prepaid_credits_input_billing_frequency")
    autoload :ProductUsagePrepaidCreditsInputBillingType, ::File.join(__dir__, "paid/types/product_usage_prepaid_credits_input_billing_type")
    autoload :ProductUsagePrepaidCreditsInput, ::File.join(__dir__, "paid/types/product_usage_prepaid_credits_input")
    autoload :ProductUsageBracketedPrepaidCreditsInputSignalType, ::File.join(__dir__, "paid/types/product_usage_bracketed_prepaid_credits_input_signal_type")
    autoload :ProductUsageBracketedPrepaidCreditsInputPricingInputKind, ::File.join(__dir__, "paid/types/product_usage_bracketed_prepaid_credits_input_pricing_input_kind")
    autoload :ProductUsageBracketedPrepaidCreditsInputPricingInput, ::File.join(__dir__, "paid/types/product_usage_bracketed_prepaid_credits_input_pricing_input")
    autoload :ProductUsageBracketedPrepaidCreditsInputCreditUnitBracketsItem, ::File.join(__dir__, "paid/types/product_usage_bracketed_prepaid_credits_input_credit_unit_brackets_item")
    autoload :ProductUsageBracketedPrepaidCreditsInputBillingFrequency, ::File.join(__dir__, "paid/types/product_usage_bracketed_prepaid_credits_input_billing_frequency")
    autoload :ProductUsageBracketedPrepaidCreditsInputBillingType, ::File.join(__dir__, "paid/types/product_usage_bracketed_prepaid_credits_input_billing_type")
    autoload :ProductUsageBracketedPrepaidCreditsInput, ::File.join(__dir__, "paid/types/product_usage_bracketed_prepaid_credits_input")
    autoload :ProductUsageCostPlusInputSignalType, ::File.join(__dir__, "paid/types/product_usage_cost_plus_input_signal_type")
    autoload :ProductUsageCostPlusInputBillingFrequency, ::File.join(__dir__, "paid/types/product_usage_cost_plus_input_billing_frequency")
    autoload :ProductUsageCostPlusInputBillingType, ::File.join(__dir__, "paid/types/product_usage_cost_plus_input_billing_type")
    autoload :ProductUsageCostPlusInput, ::File.join(__dir__, "paid/types/product_usage_cost_plus_input")
    autoload :ProductOneTimePerUnitInputFeeType, ::File.join(__dir__, "paid/types/product_one_time_per_unit_input_fee_type")
    autoload :ProductOneTimePerUnitInputBillingType, ::File.join(__dir__, "paid/types/product_one_time_per_unit_input_billing_type")
    autoload :ProductOneTimePerUnitInput, ::File.join(__dir__, "paid/types/product_one_time_per_unit_input")
    autoload :ProductSeatBasedPerUnitInputBillingFrequency, ::File.join(__dir__, "paid/types/product_seat_based_per_unit_input_billing_frequency")
    autoload :ProductSeatBasedPerUnitInputBillingType, ::File.join(__dir__, "paid/types/product_seat_based_per_unit_input_billing_type")
    autoload :ProductSeatBasedPerUnitInput, ::File.join(__dir__, "paid/types/product_seat_based_per_unit_input")
    autoload :ProductSeatBasedGraduatedInputBillingFrequency, ::File.join(__dir__, "paid/types/product_seat_based_graduated_input_billing_frequency")
    autoload :ProductSeatBasedGraduatedInputBillingType, ::File.join(__dir__, "paid/types/product_seat_based_graduated_input_billing_type")
    autoload :ProductSeatBasedGraduatedInput, ::File.join(__dir__, "paid/types/product_seat_based_graduated_input")
    autoload :ProductSeatBasedVolumeInputBillingFrequency, ::File.join(__dir__, "paid/types/product_seat_based_volume_input_billing_frequency")
    autoload :ProductSeatBasedVolumeInputBillingType, ::File.join(__dir__, "paid/types/product_seat_based_volume_input_billing_type")
    autoload :ProductSeatBasedVolumeInput, ::File.join(__dir__, "paid/types/product_seat_based_volume_input")
    autoload :ProductSeatBasedPrepaidCreditsInputBillingFrequency, ::File.join(__dir__, "paid/types/product_seat_based_prepaid_credits_input_billing_frequency")
    autoload :ProductSeatBasedPrepaidCreditsInputBillingType, ::File.join(__dir__, "paid/types/product_seat_based_prepaid_credits_input_billing_type")
    autoload :ProductSeatBasedPrepaidCreditsInput, ::File.join(__dir__, "paid/types/product_seat_based_prepaid_credits_input")
    autoload :ProductPricingInput, ::File.join(__dir__, "paid/types/product_pricing_input")
    autoload :ProductCreditBenefitInputRecipient, ::File.join(__dir__, "paid/types/product_credit_benefit_input_recipient")
    autoload :ProductCreditBenefitInputAllocationCadence, ::File.join(__dir__, "paid/types/product_credit_benefit_input_allocation_cadence")
    autoload :ProductCreditBenefitInputCreditGrantTiming, ::File.join(__dir__, "paid/types/product_credit_benefit_input_credit_grant_timing")
    autoload :ProductCreditBenefitInput, ::File.join(__dir__, "paid/types/product_credit_benefit_input")
    autoload :ProductAttributeUpsert, ::File.join(__dir__, "paid/types/product_attribute_upsert")
    autoload :UpdateProductRequest, ::File.join(__dir__, "paid/types/update_product_request")
    autoload :PlanAttributeInput, ::File.join(__dir__, "paid/types/plan_attribute_input")
    autoload :PlanPricingPricingType, ::File.join(__dir__, "paid/types/plan_pricing_pricing_type")
    autoload :PlanPricing, ::File.join(__dir__, "paid/types/plan_pricing")
    autoload :PlanCreditBenefitRecipient, ::File.join(__dir__, "paid/types/plan_credit_benefit_recipient")
    autoload :PlanCreditBenefitRolloverDurationUnit, ::File.join(__dir__, "paid/types/plan_credit_benefit_rollover_duration_unit")
    autoload :PlanCreditBenefitCreditGrantTiming, ::File.join(__dir__, "paid/types/plan_credit_benefit_credit_grant_timing")
    autoload :PlanCreditBenefit, ::File.join(__dir__, "paid/types/plan_credit_benefit")
    autoload :PlanAttribute, ::File.join(__dir__, "paid/types/plan_attribute")
    autoload :PlanStatus, ::File.join(__dir__, "paid/types/plan_status")
    autoload :Plan, ::File.join(__dir__, "paid/types/plan")
    autoload :PlanListResponse, ::File.join(__dir__, "paid/types/plan_list_response")
    autoload :PlanUpgradePathGroup, ::File.join(__dir__, "paid/types/plan_upgrade_path_group")
    autoload :PlanUpgradePathResponse, ::File.join(__dir__, "paid/types/plan_upgrade_path_response")
    autoload :UpdatePlanRequestStatus, ::File.join(__dir__, "paid/types/update_plan_request_status")
    autoload :UpdatePlanRequest, ::File.join(__dir__, "paid/types/update_plan_request")
    autoload :CustomerBillingAddressInput, ::File.join(__dir__, "paid/types/customer_billing_address_input")
    autoload :CustomerCreationState, ::File.join(__dir__, "paid/types/customer_creation_state")
    autoload :CustomerBillingAddressResponse, ::File.join(__dir__, "paid/types/customer_billing_address_response")
    autoload :CurrencyCode, ::File.join(__dir__, "paid/types/currency_code")
    autoload :StripeConnection, ::File.join(__dir__, "paid/types/stripe_connection")
    autoload :CustomerConnections, ::File.join(__dir__, "paid/types/customer_connections")
    autoload :CustomerStatus, ::File.join(__dir__, "paid/types/customer_status")
    autoload :Customer, ::File.join(__dir__, "paid/types/customer")
    autoload :CustomerListResponse, ::File.join(__dir__, "paid/types/customer_list_response")
    autoload :CustomerAlias, ::File.join(__dir__, "paid/types/customer_alias")
    autoload :CustomerAliasListResponse, ::File.join(__dir__, "paid/types/customer_alias_list_response")
    autoload :CustomerAliasCreateRequest, ::File.join(__dir__, "paid/types/customer_alias_create_request")
    autoload :EmptyResponse, ::File.join(__dir__, "paid/types/empty_response")
    autoload :CustomerStateCustomer, ::File.join(__dir__, "paid/types/customer_state_customer")
    autoload :CustomerStateOrderState, ::File.join(__dir__, "paid/types/customer_state_order_state")
    autoload :CustomerStateOrder, ::File.join(__dir__, "paid/types/customer_state_order")
    autoload :CustomerStateProductRef, ::File.join(__dir__, "paid/types/customer_state_product_ref")
    autoload :CustomerStateSeatAssignee, ::File.join(__dir__, "paid/types/customer_state_seat_assignee")
    autoload :CustomerStateCreditBalance, ::File.join(__dir__, "paid/types/customer_state_credit_balance")
    autoload :CustomerStateCreditSummary, ::File.join(__dir__, "paid/types/customer_state_credit_summary")
    autoload :CustomerStateSeatStatus, ::File.join(__dir__, "paid/types/customer_state_seat_status")
    autoload :CustomerStateSeat, ::File.join(__dir__, "paid/types/customer_state_seat")
    autoload :CustomerStateSeats, ::File.join(__dir__, "paid/types/customer_state_seats")
    autoload :CustomerStateCheckoutLinkStatus, ::File.join(__dir__, "paid/types/customer_state_checkout_link_status")
    autoload :CustomerStateCheckoutLink, ::File.join(__dir__, "paid/types/customer_state_checkout_link")
    autoload :CustomerState, ::File.join(__dir__, "paid/types/customer_state")
    autoload :UpdateCustomerRequest, ::File.join(__dir__, "paid/types/update_customer_request")
    autoload :CreditGrant, ::File.join(__dir__, "paid/types/credit_grant")
    autoload :CreditBalanceRecipient, ::File.join(__dir__, "paid/types/credit_balance_recipient")
    autoload :CreditBalance, ::File.join(__dir__, "paid/types/credit_balance")
    autoload :CreditBalanceListResponse, ::File.join(__dir__, "paid/types/credit_balance_list_response")
    autoload :CreditGrantCreateRequest, ::File.join(__dir__, "paid/types/credit_grant_create_request")
    autoload :CreditGrantCustomer, ::File.join(__dir__, "paid/types/credit_grant_customer")
    autoload :CreditGrantCurrency, ::File.join(__dir__, "paid/types/credit_grant_currency")
    autoload :CreditGrantResultStatus, ::File.join(__dir__, "paid/types/credit_grant_result_status")
    autoload :CreditGrantResult, ::File.join(__dir__, "paid/types/credit_grant_result")
    autoload :GrantCustomerCreditsResponse, ::File.join(__dir__, "paid/types/grant_customer_credits_response")
    autoload :PendingCreditConsumptionCurrency, ::File.join(__dir__, "paid/types/pending_credit_consumption_currency")
    autoload :PendingCreditConsumption, ::File.join(__dir__, "paid/types/pending_credit_consumption")
    autoload :PendingCreditConsumptionListResponse, ::File.join(__dir__, "paid/types/pending_credit_consumption_list_response")
    autoload :CustomerUserStatus, ::File.join(__dir__, "paid/types/customer_user_status")
    autoload :CustomerUser, ::File.join(__dir__, "paid/types/customer_user")
    autoload :CustomerFundingInstructionsAccountType, ::File.join(__dir__, "paid/types/customer_funding_instructions_account_type")
    autoload :CustomerFundingInstructions, ::File.join(__dir__, "paid/types/customer_funding_instructions")
    autoload :CustomerFundingInstructionsCreateRequest, ::File.join(__dir__, "paid/types/customer_funding_instructions_create_request")
    autoload :CustomerUnitStatus, ::File.join(__dir__, "paid/types/customer_unit_status")
    autoload :CustomerUnit, ::File.join(__dir__, "paid/types/customer_unit")
    autoload :CustomerUnitListResponse, ::File.join(__dir__, "paid/types/customer_unit_list_response")
    autoload :CustomerUnitCreate, ::File.join(__dir__, "paid/types/customer_unit_create")
    autoload :CustomerUnitUpdate, ::File.join(__dir__, "paid/types/customer_unit_update")
    autoload :CustomerUnitByKeyStatus, ::File.join(__dir__, "paid/types/customer_unit_by_key_status")
    autoload :CustomerUnitByKey, ::File.join(__dir__, "paid/types/customer_unit_by_key")
    autoload :CustomerUnitCreatedUnderParentStatus, ::File.join(__dir__, "paid/types/customer_unit_created_under_parent_status")
    autoload :CustomerUnitCreatedUnderParent, ::File.join(__dir__, "paid/types/customer_unit_created_under_parent")
    autoload :CustomerAPIKeyCreate, ::File.join(__dir__, "paid/types/customer_api_key_create")
    autoload :CustomerAPIKeyCreatedStatus, ::File.join(__dir__, "paid/types/customer_api_key_created_status")
    autoload :CustomerAPIKeyCreated, ::File.join(__dir__, "paid/types/customer_api_key_created")
    autoload :CustomerAPIKeyStatus, ::File.join(__dir__, "paid/types/customer_api_key_status")
    autoload :CustomerAPIKey, ::File.join(__dir__, "paid/types/customer_api_key")
    autoload :CustomerAPIKeyList, ::File.join(__dir__, "paid/types/customer_api_key_list")
    autoload :CustomerUnitCapScheduleAnchorDayType, ::File.join(__dir__, "paid/types/customer_unit_cap_schedule_anchor_day_type")
    autoload :CustomerUnitCapScheduleAnchorDay, ::File.join(__dir__, "paid/types/customer_unit_cap_schedule_anchor_day")
    autoload :CustomerUnitCapScheduleOneType, ::File.join(__dir__, "paid/types/customer_unit_cap_schedule_one_type")
    autoload :CustomerUnitCapScheduleOne, ::File.join(__dir__, "paid/types/customer_unit_cap_schedule_one")
    autoload :CustomerUnitCapSchedule, ::File.join(__dir__, "paid/types/customer_unit_cap_schedule")
    autoload :CustomerUnitCapPolicyFrequency, ::File.join(__dir__, "paid/types/customer_unit_cap_policy_frequency")
    autoload :CustomerUnitCapPolicy, ::File.join(__dir__, "paid/types/customer_unit_cap_policy")
    autoload :CustomerUnitCapPeriod, ::File.join(__dir__, "paid/types/customer_unit_cap_period")
    autoload :CustomerUnitCapCurrentPeriod, ::File.join(__dir__, "paid/types/customer_unit_cap_current_period")
    autoload :CustomerUnitCapResponse, ::File.join(__dir__, "paid/types/customer_unit_cap_response")
    autoload :CustomerUnitCapScheduleInputAnchorDayType, ::File.join(__dir__, "paid/types/customer_unit_cap_schedule_input_anchor_day_type")
    autoload :CustomerUnitCapScheduleInputAnchorDay, ::File.join(__dir__, "paid/types/customer_unit_cap_schedule_input_anchor_day")
    autoload :CustomerUnitCapScheduleInputOneType, ::File.join(__dir__, "paid/types/customer_unit_cap_schedule_input_one_type")
    autoload :CustomerUnitCapScheduleInputOne, ::File.join(__dir__, "paid/types/customer_unit_cap_schedule_input_one")
    autoload :CustomerUnitCapScheduleInput, ::File.join(__dir__, "paid/types/customer_unit_cap_schedule_input")
    autoload :CustomerUnitCapSetFrequency, ::File.join(__dir__, "paid/types/customer_unit_cap_set_frequency")
    autoload :CustomerUnitCapSet, ::File.join(__dir__, "paid/types/customer_unit_cap_set")
    autoload :CustomerUnitCapSavedPolicyFrequency, ::File.join(__dir__, "paid/types/customer_unit_cap_saved_policy_frequency")
    autoload :CustomerUnitCapSavedPolicy, ::File.join(__dir__, "paid/types/customer_unit_cap_saved_policy")
    autoload :CustomerUnitCapSetResponse, ::File.join(__dir__, "paid/types/customer_unit_cap_set_response")
    autoload :CustomerUnitCapEndedPolicyFrequency, ::File.join(__dir__, "paid/types/customer_unit_cap_ended_policy_frequency")
    autoload :CustomerUnitCapEndedPolicy, ::File.join(__dir__, "paid/types/customer_unit_cap_ended_policy")
    autoload :CustomerUnitCapEndResponse, ::File.join(__dir__, "paid/types/customer_unit_cap_end_response")
    autoload :CustomerUnitSpendWindow, ::File.join(__dir__, "paid/types/customer_unit_spend_window")
    autoload :CustomerUnitSpendResponse, ::File.join(__dir__, "paid/types/customer_unit_spend_response")
    autoload :ContactBillingAddress, ::File.join(__dir__, "paid/types/contact_billing_address")
    autoload :ContactRolesItem, ::File.join(__dir__, "paid/types/contact_roles_item")
    autoload :Contact, ::File.join(__dir__, "paid/types/contact")
    autoload :ContactListResponse, ::File.join(__dir__, "paid/types/contact_list_response")
    autoload :UpdateContactRequestRolesItem, ::File.join(__dir__, "paid/types/update_contact_request_roles_item")
    autoload :UpdateContactRequest, ::File.join(__dir__, "paid/types/update_contact_request")
    autoload :OrderCreationState, ::File.join(__dir__, "paid/types/order_creation_state")
    autoload :CreateOrderLineAttributeRequestPricingChargeType, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_charge_type")
    autoload :CreateOrderLineAttributeRequestPricingPricePointsTiersItemTierBillingType, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_price_points_tiers_item_tier_billing_type")
    autoload :CreateOrderLineAttributeRequestPricingPricePointsTiersItem, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_price_points_tiers_item")
    autoload :CreateOrderLineAttributeRequestPricingPricePoints, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_price_points")
    autoload :CreateOrderLineAttributeRequestPricingPricingModel, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_pricing_model")
    autoload :CreateOrderLineAttributeRequestPricingBillingFrequency, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_billing_frequency")
    autoload :CreateOrderLineAttributeRequestPricingBillingType, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_billing_type")
    autoload :CreateOrderLineAttributeRequestPricingSignalType, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_signal_type")
    autoload :CreateOrderLineAttributeRequestPricingCreditBenefitsItemRecipient, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_credit_benefits_item_recipient")
    autoload :CreateOrderLineAttributeRequestPricingCreditBenefitsItemRolloverDurationUnit, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_credit_benefits_item_rollover_duration_unit")
    autoload :CreateOrderLineAttributeRequestPricingCreditBenefitsItemAllocationCadence, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_credit_benefits_item_allocation_cadence")
    autoload :CreateOrderLineAttributeRequestPricingCreditBenefitsItemCreditGrantTiming, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_credit_benefits_item_credit_grant_timing")
    autoload :CreateOrderLineAttributeRequestPricingCreditBenefitsItem, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_credit_benefits_item")
    autoload :CreateOrderLineAttributeRequestPricingPricingInputKind, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_pricing_input_kind")
    autoload :CreateOrderLineAttributeRequestPricingPricingInput, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_pricing_input")
    autoload :CreateOrderLineAttributeRequestPricingCreditUnitBracketsItem, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing_credit_unit_brackets_item")
    autoload :CreateOrderLineAttributeRequestPricing, ::File.join(__dir__, "paid/types/create_order_line_attribute_request_pricing")
    autoload :CreateOrderLineAttributeRequest, ::File.join(__dir__, "paid/types/create_order_line_attribute_request")
    autoload :WritableOrderLineType, ::File.join(__dir__, "paid/types/writable_order_line_type")
    autoload :CreateOrderLineRequest, ::File.join(__dir__, "paid/types/create_order_line_request")
    autoload :OrderBillingFrequencyOverrideFrequency, ::File.join(__dir__, "paid/types/order_billing_frequency_override_frequency")
    autoload :OrderBillingFrequencyOverride, ::File.join(__dir__, "paid/types/order_billing_frequency_override")
    autoload :Order, ::File.join(__dir__, "paid/types/order")
    autoload :OrderListResponse, ::File.join(__dir__, "paid/types/order_list_response")
    autoload :OrderLineType, ::File.join(__dir__, "paid/types/order_line_type")
    autoload :OrderLine, ::File.join(__dir__, "paid/types/order_line")
    autoload :OrderLinesResponse, ::File.join(__dir__, "paid/types/order_lines_response")
    autoload :SeatAssignmentStatus, ::File.join(__dir__, "paid/types/seat_assignment_status")
    autoload :SeatAssignee, ::File.join(__dir__, "paid/types/seat_assignee")
    autoload :OrderSeat, ::File.join(__dir__, "paid/types/order_seat")
    autoload :OrderSeatListResponse, ::File.join(__dir__, "paid/types/order_seat_list_response")
    autoload :BatchSeatAssignmentsResponse, ::File.join(__dir__, "paid/types/batch_seat_assignments_response")
    autoload :InvoiceStatus, ::File.join(__dir__, "paid/types/invoice_status")
    autoload :InvoicePaymentStatus, ::File.join(__dir__, "paid/types/invoice_payment_status")
    autoload :InvoiceSource, ::File.join(__dir__, "paid/types/invoice_source")
    autoload :InvoiceTaxStatus, ::File.join(__dir__, "paid/types/invoice_tax_status")
    autoload :Invoice, ::File.join(__dir__, "paid/types/invoice")
    autoload :InvoiceListResponse, ::File.join(__dir__, "paid/types/invoice_list_response")
    autoload :InvoiceLinePaymentStatus, ::File.join(__dir__, "paid/types/invoice_line_payment_status")
    autoload :InvoiceLine, ::File.join(__dir__, "paid/types/invoice_line")
    autoload :InvoiceLinesResponse, ::File.join(__dir__, "paid/types/invoice_lines_response")
    autoload :SignalListItem, ::File.join(__dir__, "paid/types/signal_list_item")
    autoload :SignalListResponse, ::File.join(__dir__, "paid/types/signal_list_response")
    autoload :SignalLookupResponse, ::File.join(__dir__, "paid/types/signal_lookup_response")
    autoload :CustomerByID, ::File.join(__dir__, "paid/types/customer_by_id")
    autoload :CustomerByExternalID, ::File.join(__dir__, "paid/types/customer_by_external_id")
    autoload :CustomerAttribution, ::File.join(__dir__, "paid/types/customer_attribution")
    autoload :CustomerUnitAttribution, ::File.join(__dir__, "paid/types/customer_unit_attribution")
    autoload :ProductByID, ::File.join(__dir__, "paid/types/product_by_id")
    autoload :ProductByExternalID, ::File.join(__dir__, "paid/types/product_by_external_id")
    autoload :Attribution, ::File.join(__dir__, "paid/types/attribution")
    autoload :Signal, ::File.join(__dir__, "paid/types/signal")
    autoload :BulkSignalsResponse, ::File.join(__dir__, "paid/types/bulk_signals_response")
    autoload :CreditCurrencyStatus, ::File.join(__dir__, "paid/types/credit_currency_status")
    autoload :CreditCurrency, ::File.join(__dir__, "paid/types/credit_currency")
    autoload :CreditCurrencyListResponse, ::File.join(__dir__, "paid/types/credit_currency_list_response")
    autoload :CreditTransactionCustomer, ::File.join(__dir__, "paid/types/credit_transaction_customer")
    autoload :CreditTransactionCurrency, ::File.join(__dir__, "paid/types/credit_transaction_currency")
    autoload :CreditTransactionProduct, ::File.join(__dir__, "paid/types/credit_transaction_product")
    autoload :CreditTransactionType, ::File.join(__dir__, "paid/types/credit_transaction_type")
    autoload :CreditTransaction, ::File.join(__dir__, "paid/types/credit_transaction")
    autoload :CreditTransactionListResponse, ::File.join(__dir__, "paid/types/credit_transaction_list_response")
    autoload :CreditTransactionSummaryBucketCreditCurrency, ::File.join(__dir__, "paid/types/credit_transaction_summary_bucket_credit_currency")
    autoload :CreditTransactionSummaryBucket, ::File.join(__dir__, "paid/types/credit_transaction_summary_bucket")
    autoload :CreditTransactionSummaryResponseType, ::File.join(__dir__, "paid/types/credit_transaction_summary_response_type")
    autoload :CreditTransactionSummaryResponseGroupBy, ::File.join(__dir__, "paid/types/credit_transaction_summary_response_group_by")
    autoload :CreditTransactionSummaryResponseInterval, ::File.join(__dir__, "paid/types/credit_transaction_summary_response_interval")
    autoload :CreditTransactionSummaryResponse, ::File.join(__dir__, "paid/types/credit_transaction_summary_response")
    autoload :CheckoutPlanInput, ::File.join(__dir__, "paid/types/checkout_plan_input")
    autoload :CheckoutProductInput, ::File.join(__dir__, "paid/types/checkout_product_input")
    autoload :CheckoutCustomCardInput, ::File.join(__dir__, "paid/types/checkout_custom_card_input")
    autoload :CheckoutStatus, ::File.join(__dir__, "paid/types/checkout_status")
    autoload :CheckoutPlan, ::File.join(__dir__, "paid/types/checkout_plan")
    autoload :CheckoutProduct, ::File.join(__dir__, "paid/types/checkout_product")
    autoload :CheckoutCustomCard, ::File.join(__dir__, "paid/types/checkout_custom_card")
    autoload :Checkout, ::File.join(__dir__, "paid/types/checkout")
    autoload :CheckoutListResponse, ::File.join(__dir__, "paid/types/checkout_list_response")
    autoload :PlanRef, ::File.join(__dir__, "paid/types/plan_ref")
    autoload :CheckoutSelectedProduct, ::File.join(__dir__, "paid/types/checkout_selected_product")
    autoload :CheckoutDetails, ::File.join(__dir__, "paid/types/checkout_details")
    autoload :CustomerPortalStatus, ::File.join(__dir__, "paid/types/customer_portal_status")
    autoload :CustomerPortal, ::File.join(__dir__, "paid/types/customer_portal")
    autoload :SyncValueReceiptRequestProduct, ::File.join(__dir__, "paid/types/sync_value_receipt_request_product")
    autoload :SyncValueReceiptRequest, ::File.join(__dir__, "paid/types/sync_value_receipt_request")
    autoload :ValueReceiptSyncResponse, ::File.join(__dir__, "paid/types/value_receipt_sync_response")
    autoload :ValueReceiptSummary, ::File.join(__dir__, "paid/types/value_receipt_summary")
    autoload :ValueReceiptListResponse, ::File.join(__dir__, "paid/types/value_receipt_list_response")
    autoload :ValueReceiptDetail, ::File.join(__dir__, "paid/types/value_receipt_detail")
    autoload :SuccessResponse, ::File.join(__dir__, "paid/types/success_response")
    autoload :ValueMetricUnitType, ::File.join(__dir__, "paid/types/value_metric_unit_type")
    autoload :ValueMetricUnitDurationUnit, ::File.join(__dir__, "paid/types/value_metric_unit_duration_unit")
    autoload :ValueMetricUnit, ::File.join(__dir__, "paid/types/value_metric_unit")
    autoload :ValueMetricFormulaVariableType, ::File.join(__dir__, "paid/types/value_metric_formula_variable_type")
    autoload :ValueMetricFormulaVariableFormat, ::File.join(__dir__, "paid/types/value_metric_formula_variable_format")
    autoload :ValueMetricFormulaVariableFormatUnit, ::File.join(__dir__, "paid/types/value_metric_formula_variable_format_unit")
    autoload :ValueMetricFormulaVariable, ::File.join(__dir__, "paid/types/value_metric_formula_variable")
    autoload :DeliveredValueCalculationTermOperator, ::File.join(__dir__, "paid/types/delivered_value_calculation_term_operator")
    autoload :DeliveredValueCalculationTermFormat, ::File.join(__dir__, "paid/types/delivered_value_calculation_term_format")
    autoload :DeliveredValueCalculationTermFormatUnit, ::File.join(__dir__, "paid/types/delivered_value_calculation_term_format_unit")
    autoload :DeliveredValueCalculationTerm, ::File.join(__dir__, "paid/types/delivered_value_calculation_term")
    autoload :DeliveredValueCalculation, ::File.join(__dir__, "paid/types/delivered_value_calculation")
    autoload :DeliveredValueMetricSourcesItem, ::File.join(__dir__, "paid/types/delivered_value_metric_sources_item")
    autoload :DeliveredValueMetricMonetaryConversionVariablesItem, ::File.join(__dir__, "paid/types/delivered_value_metric_monetary_conversion_variables_item")
    autoload :DeliveredValueMetricMonetaryConversion, ::File.join(__dir__, "paid/types/delivered_value_metric_monetary_conversion")
    autoload :DeliveredValueMetricFormula, ::File.join(__dir__, "paid/types/delivered_value_metric_formula")
    autoload :DeliveredValueMetric, ::File.join(__dir__, "paid/types/delivered_value_metric")
    autoload :DeliveredValueSignalValue, ::File.join(__dir__, "paid/types/delivered_value_signal_value")
    autoload :DeliveredValueSignal, ::File.join(__dir__, "paid/types/delivered_value_signal")
    autoload :DeliveredValueResponsePeriod, ::File.join(__dir__, "paid/types/delivered_value_response_period")
    autoload :DeliveredValueResponseCustomer, ::File.join(__dir__, "paid/types/delivered_value_response_customer")
    autoload :DeliveredValueResponseTotals, ::File.join(__dir__, "paid/types/delivered_value_response_totals")
    autoload :DeliveredValueResponse, ::File.join(__dir__, "paid/types/delivered_value_response")
    autoload :DeliveredValueSummaryBucket, ::File.join(__dir__, "paid/types/delivered_value_summary_bucket")
    autoload :DeliveredValueSummaryResponseCustomer, ::File.join(__dir__, "paid/types/delivered_value_summary_response_customer")
    autoload :DeliveredValueSummaryResponseGroupBy, ::File.join(__dir__, "paid/types/delivered_value_summary_response_group_by")
    autoload :DeliveredValueSummaryResponseInterval, ::File.join(__dir__, "paid/types/delivered_value_summary_response_interval")
    autoload :DeliveredValueSummaryResponse, ::File.join(__dir__, "paid/types/delivered_value_summary_response")
    autoload :WebhookDeliveryStatus, ::File.join(__dir__, "paid/types/webhook_delivery_status")
    autoload :WebhookName, ::File.join(__dir__, "paid/types/webhook_name")
    autoload :Webhook, ::File.join(__dir__, "paid/types/webhook")
    autoload :WebhookListResponse, ::File.join(__dir__, "paid/types/webhook_list_response")
    autoload :WebhookUpdateResponseName, ::File.join(__dir__, "paid/types/webhook_update_response_name")
    autoload :WebhookUpdateResponse, ::File.join(__dir__, "paid/types/webhook_update_response")
    autoload :WebhookTestResponse, ::File.join(__dir__, "paid/types/webhook_test_response")
    autoload :RotateWebhookSecretResponse, ::File.join(__dir__, "paid/types/rotate_webhook_secret_response")
    autoload :PricingTierOutputTierBillingType, ::File.join(__dir__, "paid/types/pricing_tier_output_tier_billing_type")
    autoload :PricingTierOutput, ::File.join(__dir__, "paid/types/pricing_tier_output")
    autoload :PricingPricePointOutput, ::File.join(__dir__, "paid/types/pricing_price_point_output")
    autoload :PricingOutputPricingType, ::File.join(__dir__, "paid/types/pricing_output_pricing_type")
    autoload :PricingOutputSignalType, ::File.join(__dir__, "paid/types/pricing_output_signal_type")
    autoload :PricingOutput, ::File.join(__dir__, "paid/types/pricing_output")
    autoload :CreditBenefitOutput, ::File.join(__dir__, "paid/types/credit_benefit_output")
    autoload :PricingResponse, ::File.join(__dir__, "paid/types/pricing_response")
    autoload :PricingListResponse, ::File.join(__dir__, "paid/types/pricing_list_response")
    autoload :SimplePricePointTiersItemTierBillingType, ::File.join(__dir__, "paid/types/simple_price_point_tiers_item_tier_billing_type")
    autoload :SimplePricePointTiersItem, ::File.join(__dir__, "paid/types/simple_price_point_tiers_item")
    autoload :SimplePricePoint, ::File.join(__dir__, "paid/types/simple_price_point")
    autoload :RecurringPerUnitInputBillingFrequency, ::File.join(__dir__, "paid/types/recurring_per_unit_input_billing_frequency")
    autoload :RecurringPerUnitInputBillingType, ::File.join(__dir__, "paid/types/recurring_per_unit_input_billing_type")
    autoload :RecurringPerUnitInput, ::File.join(__dir__, "paid/types/recurring_per_unit_input")
    autoload :TieredPricePointTiersItemTierBillingType, ::File.join(__dir__, "paid/types/tiered_price_point_tiers_item_tier_billing_type")
    autoload :TieredPricePointTiersItem, ::File.join(__dir__, "paid/types/tiered_price_point_tiers_item")
    autoload :TieredPricePoint, ::File.join(__dir__, "paid/types/tiered_price_point")
    autoload :RecurringGraduatedInputBillingFrequency, ::File.join(__dir__, "paid/types/recurring_graduated_input_billing_frequency")
    autoload :RecurringGraduatedInputBillingType, ::File.join(__dir__, "paid/types/recurring_graduated_input_billing_type")
    autoload :RecurringGraduatedInput, ::File.join(__dir__, "paid/types/recurring_graduated_input")
    autoload :RecurringVolumeInputBillingFrequency, ::File.join(__dir__, "paid/types/recurring_volume_input_billing_frequency")
    autoload :RecurringVolumeInputBillingType, ::File.join(__dir__, "paid/types/recurring_volume_input_billing_type")
    autoload :RecurringVolumeInput, ::File.join(__dir__, "paid/types/recurring_volume_input")
    autoload :RecurringPercentOfTotalInputBillingFrequency, ::File.join(__dir__, "paid/types/recurring_percent_of_total_input_billing_frequency")
    autoload :RecurringPercentOfTotalInputBillingType, ::File.join(__dir__, "paid/types/recurring_percent_of_total_input_billing_type")
    autoload :RecurringPercentOfTotalInput, ::File.join(__dir__, "paid/types/recurring_percent_of_total_input")
    autoload :UsagePerUnitInputSignalType, ::File.join(__dir__, "paid/types/usage_per_unit_input_signal_type")
    autoload :UsagePerUnitInputBillingFrequency, ::File.join(__dir__, "paid/types/usage_per_unit_input_billing_frequency")
    autoload :UsagePerUnitInputBillingType, ::File.join(__dir__, "paid/types/usage_per_unit_input_billing_type")
    autoload :UsagePerUnitInput, ::File.join(__dir__, "paid/types/usage_per_unit_input")
    autoload :UsageGraduatedInputSignalType, ::File.join(__dir__, "paid/types/usage_graduated_input_signal_type")
    autoload :UsageGraduatedInputBillingFrequency, ::File.join(__dir__, "paid/types/usage_graduated_input_billing_frequency")
    autoload :UsageGraduatedInputBillingType, ::File.join(__dir__, "paid/types/usage_graduated_input_billing_type")
    autoload :UsageGraduatedInput, ::File.join(__dir__, "paid/types/usage_graduated_input")
    autoload :UsageVolumeInputSignalType, ::File.join(__dir__, "paid/types/usage_volume_input_signal_type")
    autoload :UsageVolumeInputBillingFrequency, ::File.join(__dir__, "paid/types/usage_volume_input_billing_frequency")
    autoload :UsageVolumeInputBillingType, ::File.join(__dir__, "paid/types/usage_volume_input_billing_type")
    autoload :UsageVolumeInput, ::File.join(__dir__, "paid/types/usage_volume_input")
    autoload :UsagePrepaidCreditsInputSignalType, ::File.join(__dir__, "paid/types/usage_prepaid_credits_input_signal_type")
    autoload :UsagePrepaidCreditsInputPricingInputKind, ::File.join(__dir__, "paid/types/usage_prepaid_credits_input_pricing_input_kind")
    autoload :UsagePrepaidCreditsInputPricingInput, ::File.join(__dir__, "paid/types/usage_prepaid_credits_input_pricing_input")
    autoload :UsagePrepaidCreditsInputBillingFrequency, ::File.join(__dir__, "paid/types/usage_prepaid_credits_input_billing_frequency")
    autoload :UsagePrepaidCreditsInputBillingType, ::File.join(__dir__, "paid/types/usage_prepaid_credits_input_billing_type")
    autoload :UsagePrepaidCreditsInput, ::File.join(__dir__, "paid/types/usage_prepaid_credits_input")
    autoload :UsageBracketedPrepaidCreditsInputSignalType, ::File.join(__dir__, "paid/types/usage_bracketed_prepaid_credits_input_signal_type")
    autoload :UsageBracketedPrepaidCreditsInputPricingInputKind, ::File.join(__dir__, "paid/types/usage_bracketed_prepaid_credits_input_pricing_input_kind")
    autoload :UsageBracketedPrepaidCreditsInputPricingInput, ::File.join(__dir__, "paid/types/usage_bracketed_prepaid_credits_input_pricing_input")
    autoload :UsageBracketedPrepaidCreditsInputCreditUnitBracketsItem, ::File.join(__dir__, "paid/types/usage_bracketed_prepaid_credits_input_credit_unit_brackets_item")
    autoload :UsageBracketedPrepaidCreditsInputBillingFrequency, ::File.join(__dir__, "paid/types/usage_bracketed_prepaid_credits_input_billing_frequency")
    autoload :UsageBracketedPrepaidCreditsInputBillingType, ::File.join(__dir__, "paid/types/usage_bracketed_prepaid_credits_input_billing_type")
    autoload :UsageBracketedPrepaidCreditsInput, ::File.join(__dir__, "paid/types/usage_bracketed_prepaid_credits_input")
    autoload :UsageCostPlusInputSignalType, ::File.join(__dir__, "paid/types/usage_cost_plus_input_signal_type")
    autoload :UsageCostPlusInputBillingFrequency, ::File.join(__dir__, "paid/types/usage_cost_plus_input_billing_frequency")
    autoload :UsageCostPlusInputBillingType, ::File.join(__dir__, "paid/types/usage_cost_plus_input_billing_type")
    autoload :UsageCostPlusInput, ::File.join(__dir__, "paid/types/usage_cost_plus_input")
    autoload :OneTimePerUnitInputFeeType, ::File.join(__dir__, "paid/types/one_time_per_unit_input_fee_type")
    autoload :OneTimePerUnitInputBillingType, ::File.join(__dir__, "paid/types/one_time_per_unit_input_billing_type")
    autoload :OneTimePerUnitInput, ::File.join(__dir__, "paid/types/one_time_per_unit_input")
    autoload :SeatBasedPerUnitInputBillingFrequency, ::File.join(__dir__, "paid/types/seat_based_per_unit_input_billing_frequency")
    autoload :SeatBasedPerUnitInputBillingType, ::File.join(__dir__, "paid/types/seat_based_per_unit_input_billing_type")
    autoload :SeatBasedPerUnitInput, ::File.join(__dir__, "paid/types/seat_based_per_unit_input")
    autoload :SeatBasedGraduatedInputBillingFrequency, ::File.join(__dir__, "paid/types/seat_based_graduated_input_billing_frequency")
    autoload :SeatBasedGraduatedInputBillingType, ::File.join(__dir__, "paid/types/seat_based_graduated_input_billing_type")
    autoload :SeatBasedGraduatedInput, ::File.join(__dir__, "paid/types/seat_based_graduated_input")
    autoload :SeatBasedVolumeInputBillingFrequency, ::File.join(__dir__, "paid/types/seat_based_volume_input_billing_frequency")
    autoload :SeatBasedVolumeInputBillingType, ::File.join(__dir__, "paid/types/seat_based_volume_input_billing_type")
    autoload :SeatBasedVolumeInput, ::File.join(__dir__, "paid/types/seat_based_volume_input")
    autoload :SeatBasedPrepaidCreditsInputBillingFrequency, ::File.join(__dir__, "paid/types/seat_based_prepaid_credits_input_billing_frequency")
    autoload :SeatBasedPrepaidCreditsInputBillingType, ::File.join(__dir__, "paid/types/seat_based_prepaid_credits_input_billing_type")
    autoload :SeatBasedPrepaidCreditsInput, ::File.join(__dir__, "paid/types/seat_based_prepaid_credits_input")
    autoload :PricingInput, ::File.join(__dir__, "paid/types/pricing_input")
    autoload :CreditBenefitInputRecipient, ::File.join(__dir__, "paid/types/credit_benefit_input_recipient")
    autoload :CreditBenefitInputAllocationCadence, ::File.join(__dir__, "paid/types/credit_benefit_input_allocation_cadence")
    autoload :CreditBenefitInputCreditGrantTiming, ::File.join(__dir__, "paid/types/credit_benefit_input_credit_grant_timing")
    autoload :CreditBenefitInput, ::File.join(__dir__, "paid/types/credit_benefit_input")
    autoload :ProductAttribution, ::File.join(__dir__, "paid/types/product_attribution")
    autoload :PrecomputedCost, ::File.join(__dir__, "paid/types/precomputed_cost")
    autoload :TokenUsage, ::File.join(__dir__, "paid/types/token_usage")
    autoload :CostOverride, ::File.join(__dir__, "paid/types/cost_override")
    autoload :UsageCost, ::File.join(__dir__, "paid/types/usage_cost")
    autoload :Cost, ::File.join(__dir__, "paid/types/cost")
    autoload :CostIngestResponse, ::File.join(__dir__, "paid/types/cost_ingest_response")
    autoload :AnalyticsQueryRequest, ::File.join(__dir__, "paid/types/analytics_query_request")
    autoload :AnalyticsColumn, ::File.join(__dir__, "paid/types/analytics_column")
    autoload :AnalyticsQueryResponseMeta, ::File.join(__dir__, "paid/types/analytics_query_response_meta")
    autoload :AnalyticsQueryResponse, ::File.join(__dir__, "paid/types/analytics_query_response")
    autoload :AnalyticsSchemaColumn, ::File.join(__dir__, "paid/types/analytics_schema_column")
    autoload :AnalyticsSchemaView, ::File.join(__dir__, "paid/types/analytics_schema_view")
    autoload :AnalyticsSchemaResponse, ::File.join(__dir__, "paid/types/analytics_schema_response")
    autoload :SignalsMetadataResponseSignalsItemPathsItemSlot, ::File.join(__dir__, "paid/types/signals_metadata_response_signals_item_paths_item_slot")
    autoload :SignalsMetadataResponseSignalsItemPathsItem, ::File.join(__dir__, "paid/types/signals_metadata_response_signals_item_paths_item")
    autoload :SignalsMetadataResponseSignalsItem, ::File.join(__dir__, "paid/types/signals_metadata_response_signals_item")
    autoload :SignalsMetadataResponseMeta, ::File.join(__dir__, "paid/types/signals_metadata_response_meta")
    autoload :SignalsMetadataResponse, ::File.join(__dir__, "paid/types/signals_metadata_response")
    autoload :CustomViewAuthoringGuide, ::File.join(__dir__, "paid/types/custom_view_authoring_guide")
    autoload :CustomViewUnitSelectionZeroMode, ::File.join(__dir__, "paid/types/custom_view_unit_selection_zero_mode")
    autoload :CustomViewUnitSelectionZero, ::File.join(__dir__, "paid/types/custom_view_unit_selection_zero")
    autoload :CustomViewUnitSelectionOneMode, ::File.join(__dir__, "paid/types/custom_view_unit_selection_one_mode")
    autoload :CustomViewUnitSelectionOne, ::File.join(__dir__, "paid/types/custom_view_unit_selection_one")
    autoload :CustomViewUnitSelectionModeMode, ::File.join(__dir__, "paid/types/custom_view_unit_selection_mode_mode")
    autoload :CustomViewUnitSelectionMode, ::File.join(__dir__, "paid/types/custom_view_unit_selection_mode")
    autoload :CustomViewUnitSelection, ::File.join(__dir__, "paid/types/custom_view_unit_selection")
    autoload :CustomViewCustomerUnit, ::File.join(__dir__, "paid/types/custom_view_customer_unit")
    autoload :CustomViewContextCapFrequency, ::File.join(__dir__, "paid/types/custom_view_context_cap_frequency")
    autoload :CustomViewContextCap, ::File.join(__dir__, "paid/types/custom_view_context_cap")
    autoload :CustomViewDataContextPeriodKind, ::File.join(__dir__, "paid/types/custom_view_data_context_period_kind")
    autoload :CustomViewDataContextPeriodUnit, ::File.join(__dir__, "paid/types/custom_view_data_context_period_unit")
    autoload :CustomViewDataContextPeriod, ::File.join(__dir__, "paid/types/custom_view_data_context_period")
    autoload :CustomViewDataContext, ::File.join(__dir__, "paid/types/custom_view_data_context")
    autoload :CustomViewPreviewHarnessColumnType, ::File.join(__dir__, "paid/types/custom_view_preview_harness_column_type")
    autoload :CustomViewPreviewHarnessColumn, ::File.join(__dir__, "paid/types/custom_view_preview_harness_column")
    autoload :CustomViewPreviewHarnessRequest, ::File.join(__dir__, "paid/types/custom_view_preview_harness_request")
    autoload :CustomViewPreviewHarness, ::File.join(__dir__, "paid/types/custom_view_preview_harness")
    autoload :CustomViewQuery, ::File.join(__dir__, "paid/types/custom_view_query")
    autoload :CustomViewFilter, ::File.join(__dir__, "paid/types/custom_view_filter")
    autoload :ValidateCustomViewRequestPeriodKind, ::File.join(__dir__, "paid/types/validate_custom_view_request_period_kind")
    autoload :ValidateCustomViewRequestPeriodUnit, ::File.join(__dir__, "paid/types/validate_custom_view_request_period_unit")
    autoload :ValidateCustomViewRequestPeriod, ::File.join(__dir__, "paid/types/validate_custom_view_request_period")
    autoload :ValidateCustomViewRequestScope, ::File.join(__dir__, "paid/types/validate_custom_view_request_scope")
    autoload :ValidateCustomViewRequest, ::File.join(__dir__, "paid/types/validate_custom_view_request")
    autoload :CustomViewValidationFinding, ::File.join(__dir__, "paid/types/custom_view_validation_finding")
    autoload :ValidateCustomViewResponse, ::File.join(__dir__, "paid/types/validate_custom_view_response")
    autoload :CustomViewSummaryStatus, ::File.join(__dir__, "paid/types/custom_view_summary_status")
    autoload :CustomViewSummaryPeriodKind, ::File.join(__dir__, "paid/types/custom_view_summary_period_kind")
    autoload :CustomViewSummaryPeriodUnit, ::File.join(__dir__, "paid/types/custom_view_summary_period_unit")
    autoload :CustomViewSummaryPeriod, ::File.join(__dir__, "paid/types/custom_view_summary_period")
    autoload :CustomViewSummaryScope, ::File.join(__dir__, "paid/types/custom_view_summary_scope")
    autoload :CustomViewSummary, ::File.join(__dir__, "paid/types/custom_view_summary")
    autoload :CustomViewListResponse, ::File.join(__dir__, "paid/types/custom_view_list_response")
    autoload :CustomViewStatus, ::File.join(__dir__, "paid/types/custom_view_status")
    autoload :CustomViewScope, ::File.join(__dir__, "paid/types/custom_view_scope")
    autoload :CustomView, ::File.join(__dir__, "paid/types/custom_view")
    autoload :RenderBundleEdit, ::File.join(__dir__, "paid/types/render_bundle_edit")
    autoload :CustomViewAuthoringDetailStatus, ::File.join(__dir__, "paid/types/custom_view_authoring_detail_status")
    autoload :CustomViewAuthoringDetailPeriodKind, ::File.join(__dir__, "paid/types/custom_view_authoring_detail_period_kind")
    autoload :CustomViewAuthoringDetailPeriodUnit, ::File.join(__dir__, "paid/types/custom_view_authoring_detail_period_unit")
    autoload :CustomViewAuthoringDetailPeriod, ::File.join(__dir__, "paid/types/custom_view_authoring_detail_period")
    autoload :CustomViewAuthoringDetailScope, ::File.join(__dir__, "paid/types/custom_view_authoring_detail_scope")
    autoload :CustomViewAuthoringDetail, ::File.join(__dir__, "paid/types/custom_view_authoring_detail")
    autoload :CustomViewDetailStatus, ::File.join(__dir__, "paid/types/custom_view_detail_status")
    autoload :CustomViewDetailPeriodKind, ::File.join(__dir__, "paid/types/custom_view_detail_period_kind")
    autoload :CustomViewDetailPeriodUnit, ::File.join(__dir__, "paid/types/custom_view_detail_period_unit")
    autoload :CustomViewDetailPeriod, ::File.join(__dir__, "paid/types/custom_view_detail_period")
    autoload :CustomViewDetailScope, ::File.join(__dir__, "paid/types/custom_view_detail_scope")
    autoload :CustomViewDetail, ::File.join(__dir__, "paid/types/custom_view_detail")
    autoload :ViewCustomerUnitsResponse, ::File.join(__dir__, "paid/types/view_customer_units_response")
    autoload :ViewDataResponse, ::File.join(__dir__, "paid/types/view_data_response")
    autoload :CustomViewEmbedTokenResponse, ::File.join(__dir__, "paid/types/custom_view_embed_token_response")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitZeroType, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_unit_zero_type")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitZero, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_unit_zero")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitDurationUnitType, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_unit_duration_u_58dfb4")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitDurationUnitDurationUnit, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_unit_duration_u_43bb75")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitDurationUnit, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_unit_duration_unit")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitTypeType, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_unit_type_type")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnitType, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_unit_type")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationUnit, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_unit")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionVariablesItem, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_monetary_conver_6283a1")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionConditionsItemOperator, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_monetary_conver_9eaa48")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionConditionsItemValue, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_monetary_conver_229e60")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionConditionsItemResultType, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_monetary_conver_19fc7e")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionConditionsItemResult, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_monetary_conver_691227")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversionConditionsItem, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_monetary_conver_292e59")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculationMonetaryConversion, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation_monetary_conversion")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItemCalculation, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item_calculation")
    autoload :ValueModelContentValueTypesItemCalculationTimelineItem, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_calculation_timeline_item")
    autoload :ValueModelContentValueTypesItemSourcesItem, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_sources_item")
    autoload :ValueModelContentValueTypesItemCategory, ::File.join(__dir__, "paid/types/value_model_content_value_types_item_category")
    autoload :ValueModelContentValueTypesItem, ::File.join(__dir__, "paid/types/value_model_content_value_types_item")
    autoload :ValueModelContentFormulasItemVariablesItemType, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_variables_item_type")
    autoload :ValueModelContentFormulasItemVariablesItemFormat, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_variables_item_format")
    autoload :ValueModelContentFormulasItemVariablesItemFormatUnit, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_variables_item_format_unit")
    autoload :ValueModelContentFormulasItemVariablesItemDerivedFromTargetUnit, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_variables_item_derived_from_target_unit")
    autoload :ValueModelContentFormulasItemVariablesItemDerivedFromSourceUnit, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_variables_item_derived_from_source_unit")
    autoload :ValueModelContentFormulasItemVariablesItemDerivedFrom, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_variables_item_derived_from")
    autoload :ValueModelContentFormulasItemVariablesItem, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_variables_item")
    autoload :ValueModelContentFormulasItemConditionsItemOperator, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_conditions_item_operator")
    autoload :ValueModelContentFormulasItemConditionsItemValue, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_conditions_item_value")
    autoload :ValueModelContentFormulasItemConditionsItemResultType, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_conditions_item_result_type")
    autoload :ValueModelContentFormulasItemConditionsItemResult, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_conditions_item_result")
    autoload :ValueModelContentFormulasItemConditionsItem, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_conditions_item")
    autoload :ValueModelContentFormulasItemDefaultResultType, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_default_result_type")
    autoload :ValueModelContentFormulasItemDefaultResult, ::File.join(__dir__, "paid/types/value_model_content_formulas_item_default_result")
    autoload :ValueModelContentFormulasItem, ::File.join(__dir__, "paid/types/value_model_content_formulas_item")
    autoload :ValueModelContentSignalsItemDefaultsValue, ::File.join(__dir__, "paid/types/value_model_content_signals_item_defaults_value")
    autoload :ValueModelContentSignalsItem, ::File.join(__dir__, "paid/types/value_model_content_signals_item")
    autoload :ValueModelContentSegmentTablesItemColumnsItemType, ::File.join(__dir__, "paid/types/value_model_content_segment_tables_item_columns_item_type")
    autoload :ValueModelContentSegmentTablesItemColumnsItem, ::File.join(__dir__, "paid/types/value_model_content_segment_tables_item_columns_item")
    autoload :ValueModelContentSegmentTablesItemRowsItem, ::File.join(__dir__, "paid/types/value_model_content_segment_tables_item_rows_item")
    autoload :ValueModelContentSegmentTablesItem, ::File.join(__dir__, "paid/types/value_model_content_segment_tables_item")
    autoload :ValueModelContentOverridesItemScope, ::File.join(__dir__, "paid/types/value_model_content_overrides_item_scope")
    autoload :ValueModelContentOverridesItemValueTypeOverridesValueVariablesValue, ::File.join(__dir__, "paid/types/value_model_content_overrides_item_value_type_overrides_value_variables_value")
    autoload :ValueModelContentOverridesItemValueTypeOverridesValue, ::File.join(__dir__, "paid/types/value_model_content_overrides_item_value_type_overrides_value")
    autoload :ValueModelContentOverridesItemAdditionalSignalsItemDefaultsValue, ::File.join(__dir__, "paid/types/value_model_content_overrides_item_additional_signals_item_defaults_value")
    autoload :ValueModelContentOverridesItemAdditionalSignalsItem, ::File.join(__dir__, "paid/types/value_model_content_overrides_item_additional_signals_item")
    autoload :ValueModelContentOverridesItemMonetaryConversionOverridesValue, ::File.join(__dir__, "paid/types/value_model_content_overrides_item_monetary_conversion_overrides_value")
    autoload :ValueModelContentOverridesItem, ::File.join(__dir__, "paid/types/value_model_content_overrides_item")
    autoload :ValueModelContent, ::File.join(__dir__, "paid/types/value_model_content")
    autoload :ValueModelDetail, ::File.join(__dir__, "paid/types/value_model_detail")
    autoload :ValueModelSummaryStatus, ::File.join(__dir__, "paid/types/value_model_summary_status")
    autoload :ValueModelSummary, ::File.join(__dir__, "paid/types/value_model_summary")
    autoload :ValueModelVersionListResponse, ::File.join(__dir__, "paid/types/value_model_version_list_response")
    autoload :BackfillResponse, ::File.join(__dir__, "paid/types/backfill_response")
    autoload :ValueMetricSummaryMonetaryConversionVariablesItem, ::File.join(__dir__, "paid/types/value_metric_summary_monetary_conversion_variables_item")
    autoload :ValueMetricSummaryMonetaryConversion, ::File.join(__dir__, "paid/types/value_metric_summary_monetary_conversion")
    autoload :ValueMetricSummary, ::File.join(__dir__, "paid/types/value_metric_summary")
    autoload :ValueMetricListResponse, ::File.join(__dir__, "paid/types/value_metric_list_response")
    autoload :ValueMetricMonetaryConversion, ::File.join(__dir__, "paid/types/value_metric_monetary_conversion")
    autoload :ValueMetricFormula, ::File.join(__dir__, "paid/types/value_metric_formula")
    autoload :ValueMetricSignalBinding, ::File.join(__dir__, "paid/types/value_metric_signal_binding")
    autoload :ValueMetricValidationResponseErrorsItem, ::File.join(__dir__, "paid/types/value_metric_validation_response_errors_item")
    autoload :ValueMetricValidationResponse, ::File.join(__dir__, "paid/types/value_metric_validation_response")
    autoload :ValueModelAuthoringGuideExamplesItem, ::File.join(__dir__, "paid/types/value_model_authoring_guide_examples_item")
    autoload :ValueModelAuthoringGuide, ::File.join(__dir__, "paid/types/value_model_authoring_guide")
    autoload :ValueMetricDetailSourcesItem, ::File.join(__dir__, "paid/types/value_metric_detail_sources_item")
    autoload :ValueMetricDetailMonetaryConversionVariablesItem, ::File.join(__dir__, "paid/types/value_metric_detail_monetary_conversion_variables_item")
    autoload :ValueMetricDetailMonetaryConversion, ::File.join(__dir__, "paid/types/value_metric_detail_monetary_conversion")
    autoload :ValueMetricDetailFormula, ::File.join(__dir__, "paid/types/value_metric_detail_formula")
    autoload :ValueMetricDetail, ::File.join(__dir__, "paid/types/value_metric_detail")
    autoload :ValueMetricWriteAck, ::File.join(__dir__, "paid/types/value_metric_write_ack")
    autoload :ValueMetricVariableEditFormat, ::File.join(__dir__, "paid/types/value_metric_variable_edit_format")
    autoload :ValueMetricVariableEditFormatUnit, ::File.join(__dir__, "paid/types/value_metric_variable_edit_format_unit")
    autoload :ValueMetricVariableEdit, ::File.join(__dir__, "paid/types/value_metric_variable_edit")
    autoload :PaymentMethodSetupSetupIntent, ::File.join(__dir__, "paid/types/payment_method_setup_setup_intent")
    autoload :PaymentMethodSetup, ::File.join(__dir__, "paid/types/payment_method_setup")
    autoload :PaymentMethodCard, ::File.join(__dir__, "paid/types/payment_method_card")
    autoload :PaymentMethod, ::File.join(__dir__, "paid/types/payment_method")
    autoload :PaymentMethodListResponse, ::File.join(__dir__, "paid/types/payment_method_list_response")
    autoload :PaymentType, ::File.join(__dir__, "paid/types/payment_type")
    autoload :PaymentCreateStatus, ::File.join(__dir__, "paid/types/payment_create_status")
    autoload :Payment, ::File.join(__dir__, "paid/types/payment")
    autoload :PaymentListResponse, ::File.join(__dir__, "paid/types/payment_list_response")
    autoload :PaymentAllocationInput, ::File.join(__dir__, "paid/types/payment_allocation_input")
    autoload :PaymentAllocation, ::File.join(__dir__, "paid/types/payment_allocation")
    autoload :PaymentAllocationCreateResponse, ::File.join(__dir__, "paid/types/payment_allocation_create_response")
    autoload :PaymentAllocationListResponse, ::File.join(__dir__, "paid/types/payment_allocation_list_response")
    autoload :AmendmentChargeType, ::File.join(__dir__, "paid/types/amendment_charge_type")
    autoload :AmendmentAttributeState, ::File.join(__dir__, "paid/types/amendment_attribute_state")
    autoload :AmendmentIntentKind, ::File.join(__dir__, "paid/types/amendment_intent_kind")
    autoload :AmendmentAxisRelevance, ::File.join(__dir__, "paid/types/amendment_axis_relevance")
    autoload :MoneyAxisValue, ::File.join(__dir__, "paid/types/money_axis_value")
    autoload :MoneyAxisOptionsOptionsItem, ::File.join(__dir__, "paid/types/money_axis_options_options_item")
    autoload :MoneyAxisOptions, ::File.join(__dir__, "paid/types/money_axis_options")
    autoload :UsageAttributionAxisValue, ::File.join(__dir__, "paid/types/usage_attribution_axis_value")
    autoload :UsageAttributionAxisOptionsOptionsItem, ::File.join(__dir__, "paid/types/usage_attribution_axis_options_options_item")
    autoload :UsageAttributionAxisOptions, ::File.join(__dir__, "paid/types/usage_attribution_axis_options")
    autoload :ChargeStubAxisOptionsOptionsItemValue, ::File.join(__dir__, "paid/types/charge_stub_axis_options_options_item_value")
    autoload :ChargeStubAxisOptionsOptionsItem, ::File.join(__dir__, "paid/types/charge_stub_axis_options_options_item")
    autoload :ChargeStubAxisOptions, ::File.join(__dir__, "paid/types/charge_stub_axis_options")
    autoload :CreditGrantValue, ::File.join(__dir__, "paid/types/credit_grant_value")
    autoload :CreditGrantAxisOptionsOptionsItem, ::File.join(__dir__, "paid/types/credit_grant_axis_options_options_item")
    autoload :CreditGrantAxisOptions, ::File.join(__dir__, "paid/types/credit_grant_axis_options")
    autoload :AmendmentAxisOptions, ::File.join(__dir__, "paid/types/amendment_axis_options")
    autoload :AmendmentIntentOptions, ::File.join(__dir__, "paid/types/amendment_intent_options")
    autoload :AmendmentAttributeOptions, ::File.join(__dir__, "paid/types/amendment_attribute_options")
    autoload :AmendmentLineOptions, ::File.join(__dir__, "paid/types/amendment_line_options")
    autoload :AmendmentBillingType, ::File.join(__dir__, "paid/types/amendment_billing_type")
    autoload :AmendmentPricingModel, ::File.join(__dir__, "paid/types/amendment_pricing_model")
    autoload :AmendmentPricingClause, ::File.join(__dir__, "paid/types/amendment_pricing_clause")
    autoload :ChargeStubAddAxisOptionsOptionsItemValue, ::File.join(__dir__, "paid/types/charge_stub_add_axis_options_options_item_value")
    autoload :ChargeStubAddAxisOptionsOptionsItem, ::File.join(__dir__, "paid/types/charge_stub_add_axis_options_options_item")
    autoload :ChargeStubAddAxisOptions, ::File.join(__dir__, "paid/types/charge_stub_add_axis_options")
    autoload :CreditGrantAddAxisOptionsOptionsItem, ::File.join(__dir__, "paid/types/credit_grant_add_axis_options_options_item")
    autoload :CreditGrantAddAxisOptions, ::File.join(__dir__, "paid/types/credit_grant_add_axis_options")
    autoload :AmendmentAddAxisOptions, ::File.join(__dir__, "paid/types/amendment_add_axis_options")
    autoload :AmendmentAddAttributeOptions, ::File.join(__dir__, "paid/types/amendment_add_attribute_options")
    autoload :AmendmentOptions, ::File.join(__dir__, "paid/types/amendment_options")
    autoload :AmendmentErrorResponse, ::File.join(__dir__, "paid/types/amendment_error_response")
    autoload :UpdateQuantityIntentTreatment, ::File.join(__dir__, "paid/types/update_quantity_intent_treatment")
    autoload :UpdateQuantityIntent, ::File.join(__dir__, "paid/types/update_quantity_intent")
    autoload :UpdatePricingIntentTreatment, ::File.join(__dir__, "paid/types/update_pricing_intent_treatment")
    autoload :UpdatePricingIntent, ::File.join(__dir__, "paid/types/update_pricing_intent")
    autoload :EndAttributeIntentTreatment, ::File.join(__dir__, "paid/types/end_attribute_intent_treatment")
    autoload :EndAttributeIntent, ::File.join(__dir__, "paid/types/end_attribute_intent")
    autoload :AddFromCatalogIntentChargeStub, ::File.join(__dir__, "paid/types/add_from_catalog_intent_charge_stub")
    autoload :AddFromCatalogIntent, ::File.join(__dir__, "paid/types/add_from_catalog_intent")
    autoload :AddAttributeIntentChargeStub, ::File.join(__dir__, "paid/types/add_attribute_intent_charge_stub")
    autoload :AddAttributeIntentCreditGrant, ::File.join(__dir__, "paid/types/add_attribute_intent_credit_grant")
    autoload :AddAttributeIntentTreatment, ::File.join(__dir__, "paid/types/add_attribute_intent_treatment")
    autoload :AddAttributeIntent, ::File.join(__dir__, "paid/types/add_attribute_intent")
    autoload :UpdateLineTermIntentTreatment, ::File.join(__dir__, "paid/types/update_line_term_intent_treatment")
    autoload :UpdateLineTermIntent, ::File.join(__dir__, "paid/types/update_line_term_intent")
    autoload :UpdateOrderTermIntentTreatment, ::File.join(__dir__, "paid/types/update_order_term_intent_treatment")
    autoload :UpdateOrderTermIntent, ::File.join(__dir__, "paid/types/update_order_term_intent")
    autoload :UnifiedAmendmentIntent, ::File.join(__dir__, "paid/types/unified_amendment_intent")
    autoload :PlannedEnd, ::File.join(__dir__, "paid/types/planned_end")
    autoload :PlannedReplace, ::File.join(__dir__, "paid/types/planned_replace")
    autoload :PlannedCopy, ::File.join(__dir__, "paid/types/planned_copy")
    autoload :AmendmentPlanLineType, ::File.join(__dir__, "paid/types/amendment_plan_line_type")
    autoload :PlannedAddChargeStub, ::File.join(__dir__, "paid/types/planned_add_charge_stub")
    autoload :PlannedAdd, ::File.join(__dir__, "paid/types/planned_add")
    autoload :PlannedOrderTerm, ::File.join(__dir__, "paid/types/planned_order_term")
    autoload :PlannedOperations, ::File.join(__dir__, "paid/types/planned_operations")
    autoload :AmendmentMoneyBilling, ::File.join(__dir__, "paid/types/amendment_money_billing")
    autoload :AmendmentPlanMoneyEffectKind, ::File.join(__dir__, "paid/types/amendment_plan_money_effect_kind")
    autoload :AmendmentPlanMoneyEffect, ::File.join(__dir__, "paid/types/amendment_plan_money_effect")
    autoload :AmendmentCreditEffectKind, ::File.join(__dir__, "paid/types/amendment_credit_effect_kind")
    autoload :AmendmentPlanCreditEffect, ::File.join(__dir__, "paid/types/amendment_plan_credit_effect")
    autoload :AmendmentPlanUsageEffectKind, ::File.join(__dir__, "paid/types/amendment_plan_usage_effect_kind")
    autoload :AmendmentPlanUsageEffect, ::File.join(__dir__, "paid/types/amendment_plan_usage_effect")
    autoload :AmendmentAxisID, ::File.join(__dir__, "paid/types/amendment_axis_id")
    autoload :AmendmentAxisChoiceValue, ::File.join(__dir__, "paid/types/amendment_axis_choice_value")
    autoload :AmendmentTreatmentSource, ::File.join(__dir__, "paid/types/amendment_treatment_source")
    autoload :AmendmentPlanTreatmentResolution, ::File.join(__dir__, "paid/types/amendment_plan_treatment_resolution")
    autoload :AmendmentPlanChange, ::File.join(__dir__, "paid/types/amendment_plan_change")
    autoload :AmendmentPlanAttributeDiff, ::File.join(__dir__, "paid/types/amendment_plan_attribute_diff")
    autoload :AmendmentPlan, ::File.join(__dir__, "paid/types/amendment_plan")
    autoload :UnifiedAmendmentResponse, ::File.join(__dir__, "paid/types/unified_amendment_response")
    autoload :ProvisionExternalReferenceSource, ::File.join(__dir__, "paid/types/provision_external_reference_source")
    autoload :ProvisionExternalReference, ::File.join(__dir__, "paid/types/provision_external_reference")
    autoload :ProvisionCustomerCreationState, ::File.join(__dir__, "paid/types/provision_customer_creation_state")
    autoload :ProvisionCustomer, ::File.join(__dir__, "paid/types/provision_customer")
    autoload :ProvisionContactRolesItem, ::File.join(__dir__, "paid/types/provision_contact_roles_item")
    autoload :ProvisionContact, ::File.join(__dir__, "paid/types/provision_contact")
    autoload :ProvisionCreditBenefitRecipient, ::File.join(__dir__, "paid/types/provision_credit_benefit_recipient")
    autoload :ProvisionCreditBenefitAllocationCadence, ::File.join(__dir__, "paid/types/provision_credit_benefit_allocation_cadence")
    autoload :ProvisionCreditBenefitCreditGrantTiming, ::File.join(__dir__, "paid/types/provision_credit_benefit_credit_grant_timing")
    autoload :ProvisionCreditBenefitRolloverDurationUnit, ::File.join(__dir__, "paid/types/provision_credit_benefit_rollover_duration_unit")
    autoload :ProvisionCreditBenefit, ::File.join(__dir__, "paid/types/provision_credit_benefit")
    autoload :ProvisionProductAttributesItemPricingChargeType, ::File.join(__dir__, "paid/types/provision_product_attributes_item_pricing_charge_type")
    autoload :ProvisionProductAttributesItemPricingPricePointsTiersItemTierBillingType, ::File.join(__dir__, "paid/types/provision_product_attributes_item_pricing_price_points_tiers_item_tier_billing_type")
    autoload :ProvisionProductAttributesItemPricingPricePointsTiersItem, ::File.join(__dir__, "paid/types/provision_product_attributes_item_pricing_price_points_tiers_item")
    autoload :ProvisionProductAttributesItemPricingPricePoints, ::File.join(__dir__, "paid/types/provision_product_attributes_item_pricing_price_points")
    autoload :ProvisionProductAttributesItemPricingPricingModel, ::File.join(__dir__, "paid/types/provision_product_attributes_item_pricing_pricing_model")
    autoload :ProvisionProductAttributesItemPricingBillingFrequency, ::File.join(__dir__, "paid/types/provision_product_attributes_item_pricing_billing_frequency")
    autoload :ProvisionProductAttributesItemPricingBillingType, ::File.join(__dir__, "paid/types/provision_product_attributes_item_pricing_billing_type")
    autoload :ProvisionProductAttributesItemPricing, ::File.join(__dir__, "paid/types/provision_product_attributes_item_pricing")
    autoload :ProvisionProductAttributesItem, ::File.join(__dir__, "paid/types/provision_product_attributes_item")
    autoload :ProvisionProduct, ::File.join(__dir__, "paid/types/provision_product")
    autoload :ProvisionOrderLineAttributePricingChargeType, ::File.join(__dir__, "paid/types/provision_order_line_attribute_pricing_charge_type")
    autoload :ProvisionOrderLineAttributePricingPricePointsTiersItemTierBillingType, ::File.join(__dir__, "paid/types/provision_order_line_attribute_pricing_price_points_tiers_item_tier_billing_type")
    autoload :ProvisionOrderLineAttributePricingPricePointsTiersItem, ::File.join(__dir__, "paid/types/provision_order_line_attribute_pricing_price_points_tiers_item")
    autoload :ProvisionOrderLineAttributePricingPricePoints, ::File.join(__dir__, "paid/types/provision_order_line_attribute_pricing_price_points")
    autoload :ProvisionOrderLineAttributePricingPricingModel, ::File.join(__dir__, "paid/types/provision_order_line_attribute_pricing_pricing_model")
    autoload :ProvisionOrderLineAttributePricingBillingFrequency, ::File.join(__dir__, "paid/types/provision_order_line_attribute_pricing_billing_frequency")
    autoload :ProvisionOrderLineAttributePricingBillingType, ::File.join(__dir__, "paid/types/provision_order_line_attribute_pricing_billing_type")
    autoload :ProvisionOrderLineAttributePricing, ::File.join(__dir__, "paid/types/provision_order_line_attribute_pricing")
    autoload :ProvisionOrderLineAttributeDiscountType, ::File.join(__dir__, "paid/types/provision_order_line_attribute_discount_type")
    autoload :ProvisionOrderLineAttribute, ::File.join(__dir__, "paid/types/provision_order_line_attribute")
    autoload :WritableProvisionOrderLineType, ::File.join(__dir__, "paid/types/writable_provision_order_line_type")
    autoload :ProvisionOrderLine, ::File.join(__dir__, "paid/types/provision_order_line")
    autoload :ProvisionBillingFrequencyOverrideFrequency, ::File.join(__dir__, "paid/types/provision_billing_frequency_override_frequency")
    autoload :ProvisionBillingFrequencyOverride, ::File.join(__dir__, "paid/types/provision_billing_frequency_override")
    autoload :ProvisionOrderStatus, ::File.join(__dir__, "paid/types/provision_order_status")
    autoload :ProvisionOrderPaymentTerms, ::File.join(__dir__, "paid/types/provision_order_payment_terms")
    autoload :ProvisionOrder, ::File.join(__dir__, "paid/types/provision_order")
    autoload :ProvisionCreatedCustomerProvisionStatus, ::File.join(__dir__, "paid/types/provision_created_customer_provision_status")
    autoload :ProvisionCreatedCustomer, ::File.join(__dir__, "paid/types/provision_created_customer")
    autoload :ProvisionCreatedContactProvisionStatus, ::File.join(__dir__, "paid/types/provision_created_contact_provision_status")
    autoload :ProvisionCreatedContact, ::File.join(__dir__, "paid/types/provision_created_contact")
    autoload :ProvisionOrderLineType, ::File.join(__dir__, "paid/types/provision_order_line_type")
    autoload :ProvisionCreatedOrderLineProvisionStatus, ::File.join(__dir__, "paid/types/provision_created_order_line_provision_status")
    autoload :ProvisionCreatedOrderLine, ::File.join(__dir__, "paid/types/provision_created_order_line")
    autoload :ProvisionCreatedOrderProvisionStatus, ::File.join(__dir__, "paid/types/provision_created_order_provision_status")
    autoload :ProvisionCreatedOrder, ::File.join(__dir__, "paid/types/provision_created_order")
    autoload :ProvisionResponseStatus, ::File.join(__dir__, "paid/types/provision_response_status")
    autoload :ProvisionResponse, ::File.join(__dir__, "paid/types/provision_response")
    autoload :SignalSummarySignalSelection, ::File.join(__dir__, "paid/types/signal_summary_signal_selection")
    autoload :SignalSummaryPresenceDimensionValuesTrue, ::File.join(__dir__, "paid/types/signal_summary_presence_dimension_values_true")
    autoload :SignalSummaryPresenceDimensionValuesFalse, ::File.join(__dir__, "paid/types/signal_summary_presence_dimension_values_false")
    autoload :SignalSummaryPresenceDimensionValues, ::File.join(__dir__, "paid/types/signal_summary_presence_dimension_values")
    autoload :SignalSummaryPresenceDimension, ::File.join(__dir__, "paid/types/signal_summary_presence_dimension")
    autoload :SignalSummaryBandsDimensionBracketsItem, ::File.join(__dir__, "paid/types/signal_summary_bands_dimension_brackets_item")
    autoload :SignalSummaryBandsDimension, ::File.join(__dir__, "paid/types/signal_summary_bands_dimension")
    autoload :SignalSummaryMeasureFn, ::File.join(__dir__, "paid/types/signal_summary_measure_fn")
    autoload :SignalSummaryMeasure, ::File.join(__dir__, "paid/types/signal_summary_measure")
    autoload :SignalSummarySpecInputInterval, ::File.join(__dir__, "paid/types/signal_summary_spec_input_interval")
    autoload :SignalSummarySpecInputDimensionsItem, ::File.join(__dir__, "paid/types/signal_summary_spec_input_dimensions_item")
    autoload :SignalSummarySpecInput, ::File.join(__dir__, "paid/types/signal_summary_spec_input")
    autoload :SignalSummaryDefinitionSpecInterval, ::File.join(__dir__, "paid/types/signal_summary_definition_spec_interval")
    autoload :SignalSummaryDefinitionSpecDimensionsItem, ::File.join(__dir__, "paid/types/signal_summary_definition_spec_dimensions_item")
    autoload :SignalSummaryDefinitionSpec, ::File.join(__dir__, "paid/types/signal_summary_definition_spec")
    autoload :SignalSummaryColumn, ::File.join(__dir__, "paid/types/signal_summary_column")
    autoload :SignalSummaryExportStatus, ::File.join(__dir__, "paid/types/signal_summary_export_status")
    autoload :SignalSummaryExportFormat, ::File.join(__dir__, "paid/types/signal_summary_export_format")
    autoload :SignalSummaryExport, ::File.join(__dir__, "paid/types/signal_summary_export")
    autoload :SignalSummaryGroups, ::File.join(__dir__, "paid/types/signal_summary_groups")
    autoload :SignalSummaryPoint, ::File.join(__dir__, "paid/types/signal_summary_point")
    autoload :SignalSummaryPage, ::File.join(__dir__, "paid/types/signal_summary_page")
    autoload :SignalSummaryResponseInterval, ::File.join(__dir__, "paid/types/signal_summary_response_interval")
    autoload :SignalSummaryResponseGroupBy, ::File.join(__dir__, "paid/types/signal_summary_response_group_by")
    autoload :SignalSummaryResponse, ::File.join(__dir__, "paid/types/signal_summary_response")
  end
end
