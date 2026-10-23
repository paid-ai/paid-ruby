# frozen_string_literal: true

module Paid
  module CustomViewsExperimental
    class Client
      # @param client [Paid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # ⚠️ **Experimental** — this endpoint may change or be removed without notice and is not subject to v2
      # backwards-compatibility guarantees. Do not build production-critical integrations against it yet.
      #
      # Lists the organization's custom views (newest first) with lightweight summary info — name, status, query count,
      # default date range, created date. Does not return the SQL or render bundle; fetch a single view via
      # getCustomView for those.
      #
      # @param request_options [Hash]
      # @param _params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.custom_views_experimental.list_custom_views
      #
      # @return [Paid::Types::CustomViewListResponse]
      def list_custom_views(request_options: {}, **_params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "experimental/views/",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomViewListResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # ⚠️ **Experimental** — this endpoint may change or be removed without notice and is not subject to v2
      # backwards-compatibility guarantees. Do not build production-critical integrations against it yet.
      #
      # ⚠️ Only call this when the user has EXPLICITLY asked to save or create the view. After generating or previewing
      # a dashboard, do NOT automatically save it — show it to the user and wait for them to ask you to save it. A
      # customer-scoped view is created as a DRAFT — creating it is NOT permission to publish; never chain a publish
      # onto a create. An organization-scoped view is created already PUBLISHED instead: it has no draft state and no
      # publish step at all (never call publishCustomView on one — it's a no-op, and unpublishView refuses it outright).
      # After saving, hand the user the previewUrl and wait for their feedback before doing anything else. Saves named
      # analytics queries + a self-contained HTML render bundle. **Call getCustomViewAuthoringGuide (GET
      # /experimental/views/authoring-guide) first** — it returns the full guide and a copy-paste interactive template.
      # Key rules: (1) Do NOT add a customer filter to the SQL — the database scopes every query to the viewing customer
      # at embed time. (2) Each query's SQL must be SELECT-only; return clearly-named columns. Compute metric VALUES in
      # SQL (e.g. (count()*2)/5 AS custom_metric) — derive a number in the render bundle only when it depends on user
      # interaction (toggle/filter/hover) or is pure formatting of a value a query already returns. (3) The render
      # bundle must be SELF-CONTAINED — inline all CSS/JS/charting, NO external loads or fetch (the sandbox has
      # connect-src 'none'); it must listen for the `paid:data` message (data keyed by query id) and re-render on each
      # one. (4) Make it INTERACTIVE — mousemove hover tooltips and at least one addEventListener-wired control that
      # re-renders (a static chart feels broken). (5) The render bundle is the single source of truth — BEFORE saving,
      # preview the EXACT bundle in the user's current client (call getCustomViewPreviewHarness with your bundle +
      # sample data and render the HTML it returns) and show it to the user; that preview in the current client is how
      # the user first sees the dashboard. Do NOT save a draft just to preview it in Paid — creating writes to the
      # user's real account and is never a preview step. Do NOT build a separate chart, and only show numbers that come
      # from a declared query. (6) A view is a FULL dashboard — include as many charts/KPIs as the analysis has. Keep
      # every element derived from the single viewing customer (KPIs, trends, type mix); drop only cross-customer
      # comparisons (rankings, share-of-total, 'N customers'). Don't simplify to one chart. (7) To make the date range
      # adjustable (e.g. the user says 'last month'), write the date boundary as `{period_start:DateTime}` /
      # `{period_end:DateTime}` placeholders in the SQL and pass a default `period` (relative like
      # {kind:'relative',unit:'month',amount:1}, or absolute start/end). The org user can then change it in Paid without
      # re-authoring. A query using the placeholders REQUIRES a period. Do NOT add your own date-range picker to the
      # render bundle — Paid owns the timeframe and the bundle receives already-filtered data; a second in-bundle picker
      # cannot re-run the SQL. (8) Check your draft with validateCustomView (POST /experimental/views/validate) BEFORE
      # asking the user to save — it runs these same gates without persisting and reports every problem at once. The
      # response returns a `previewUrl` — give it to the user so they can open the new view in Paid.
      #
      # @param request_options [Hash]
      # @param params [Paid::CustomViewsExperimental::Types::CreateCustomViewRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.custom_views_experimental.create_custom_view(
      #     name: "Usage over time",
      #     queries: [{
      #       id: "usage",
      #       sql: "SELECT toDate(created_at) AS day, count() AS signals FROM fact_signal GROUP BY day ORDER BY day"
      #     }],
      #     render_bundle: "<!doctype html><body>…</body>"
      #   )
      #
      # @return [Paid::Types::CustomView]
      def create_custom_view(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "experimental/views/",
          body: Paid::CustomViewsExperimental::Types::CreateCustomViewRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomView.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # ⚠️ **Experimental** — this endpoint may change or be removed without notice and is not subject to v2
      # backwards-compatibility guarantees. Do not build production-critical integrations against it yet.
      #
      # ⚠️ Never publish as an automatic follow-up to creating or generating a view. Only call this after you have shown
      # the user the built/previewed view and they have EXPLICITLY approved publishing — building and publishing are
      # separate user decisions, and answering an earlier question (e.g. the view's scope) is NOT publish approval.
      # Flips the view from DRAFT to PUBLISHED. Only PUBLISHED views are served on the embed data path — this is the
      # gate that stops an unreviewed view reaching end-customers. Idempotent: publishing an already-published view is a
      # no-op success. The response returns a `previewUrl` — give it to the user so they can open the view in Paid.
      #
      # @param request_options [Hash]
      # @param params [Paid::CustomViewsExperimental::Types::PublishCustomViewRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :display_id
      #
      # @example
      #   client.custom_views_experimental.publish_custom_view(display_id: "displayId")
      #
      # @return [Paid::Types::CustomView]
      def publish_custom_view(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::CustomViewsExperimental::Types::PublishCustomViewRequest.new(params).to_h
        non_body_param_names = %w[displayId]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "experimental/views/#{URI.encode_uri_component(params[:display_id].to_s)}/publish",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomView.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # ⚠️ **Experimental** — this endpoint may change or be removed without notice and is not subject to v2
      # backwards-compatibility guarantees. Do not build production-critical integrations against it yet.
      #
      # Updates the view's default date range (the period applied to queries that use the `{period_start:DateTime}` /
      # `{period_end:DateTime}` placeholders). Accepts a relative rolling window (e.g. last 30 days) or a fixed
      # start/end range. Lets the period be changed after deployment without re-authoring the SQL. Applies to DRAFT or
      # PUBLISHED views.
      #
      # @param request_options [Hash]
      # @param params [Paid::CustomViewsExperimental::Types::UpdateCustomViewPeriodRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :display_id
      #
      # @example
      #   client.custom_views_experimental.update_custom_view_period(
      #     display_id: "displayId",
      #     period: {
      #       kind: "relative"
      #     }
      #   )
      #
      # @return [Paid::Types::CustomView]
      def update_custom_view_period(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::CustomViewsExperimental::Types::UpdateCustomViewPeriodRequest.new(params).to_h
        non_body_param_names = %w[displayId]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "experimental/views/#{URI.encode_uri_component(params[:display_id].to_s)}/period",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomView.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # ⚠️ **Experimental** — this endpoint may change or be removed without notice and is not subject to v2
      # backwards-compatibility guarantees. Do not build production-critical integrations against it yet.
      #
      # Returns the view's name, status, query ids, and the author render bundle for the owning organization. Only
      # PUBLISHED views are returned; a DRAFT returns 404 (use getCustomViewAuthoring to read a DRAFT). Used by the
      # trusted preview/embed frame to render the sandbox; the per-customer data is fetched separately via
      # /:displayId/data.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :display_id
      #
      # @example
      #   client.custom_views_experimental.get_custom_view(display_id: "displayId")
      #
      # @return [Paid::Types::CustomViewDetail]
      def get_custom_view(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "experimental/views/#{URI.encode_uri_component(params[:display_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomViewDetail.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # ⚠️ **Experimental** — this endpoint may change or be removed without notice and is not subject to v2
      # backwards-compatibility guarantees. Do not build production-critical integrations against it yet.
      #
      # Partially updates a view. Omitted fields are left unchanged. For REVISIONS, prefer the incremental fields —
      # `bundleEdits` (exact search-and-replace on the stored render bundle) and `queryUpserts`/`queryRemovals`
      # (per-query changes) — so you transmit only what changed instead of re-sending the whole payload. The
      # full-replacement fields remain for rewrites: `renderBundle`, and `queries` (a FULL replacement of the query list
      # — never drop queries the user didn't ask to remove). Replacement and incremental forms of the same aspect cannot
      # be combined. The resulting SQL and bundle pass the same validation as createCustomView (SELECT-only, size cap,
      # self-contained, paid:data listener). Works on DRAFT or PUBLISHED views — published embeds pick the change up on
      # their next load. If the queries or hierarchy setting change during validation, returns 409
      # CUSTOM_VIEW_UPDATE_CONFLICT; fetch the current authoring definition and reapply your changes before retrying.
      #
      # @param request_options [Hash]
      # @param params [Paid::CustomViewsExperimental::Types::UpdateCustomViewRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :display_id
      #
      # @example
      #   client.custom_views_experimental.update_custom_view(display_id: "displayId")
      #
      # @return [Paid::Types::CustomView]
      def update_custom_view(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        request_data = Paid::CustomViewsExperimental::Types::UpdateCustomViewRequest.new(params).to_h
        non_body_param_names = %w[displayId]
        body = request_data.except(*non_body_param_names)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "experimental/views/#{URI.encode_uri_component(params[:display_id].to_s)}",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomView.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # ⚠️ **Experimental** — this endpoint may change or be removed without notice and is not subject to v2
      # backwards-compatibility guarantees. Do not build production-critical integrations against it yet.
      #
      # Lists active customer units for a published customer-scoped view with hierarchyEnabled set to true. Hierarchy
      # eligibility is independent of the requested page or usage; requires credit hierarchies to be enabled for the
      # organization.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :display_id
      # @option params [Integer, nil] :limit
      # @option params [Integer, nil] :offset
      # @option params [String] :customer_id
      #
      # @example
      #   client.custom_views_experimental.get_custom_view_customer_units(
      #     display_id: "displayId",
      #     customer_id: "cus_acme"
      #   )
      #
      # @return [Paid::Types::ViewCustomerUnitsResponse]
      def get_custom_view_customer_units(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["customerId"] = params[:customer_id] if params.key?(:customer_id)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "experimental/views/#{URI.encode_uri_component(params[:display_id].to_s)}/customer-units",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ViewCustomerUnitsResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # ⚠️ **Experimental** — this endpoint may change or be removed without notice and is not subject to v2
      # backwards-compatibility guarantees. Do not build production-critical integrations against it yet.
      #
      # Runs every stored query of the view on the read-only analytics database and returns the result sets keyed by
      # query id. For a customer-scoped view (the default), the query is scoped to the caller's organization AND the
      # given `customerId` (both enforced as ClickHouse row filters) — `customerId` is required. For an
      # organization-scoped view, the data is org-wide (scoped only to the caller's organization) and `customerId` is
      # ignored. The scope is enforced by the database — it cannot be widened by the stored SQL. If the view declares
      # filters, pass per-request values as `filter_<name>` query parameters (e.g. `filter_region=eu`); undeclared names
      # or disallowed values are rejected with 400. Filters narrow data within the scope — never widen it. Only
      # PUBLISHED views are served by default; a DRAFT returns 404. To check a saved DRAFT's real data before
      # publishing, pass `includeDraft=true`. Embeds and share links never serve a DRAFT.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :display_id
      # @option params [String, nil] :customer_id
      # @option params [Paid::CustomViewsExperimental::Types::GetCustomViewDataRequestPeriodKind, nil] :period_kind
      # @option params [Paid::CustomViewsExperimental::Types::GetCustomViewDataRequestPeriodUnit, nil] :period_unit
      # @option params [Integer, nil] :period_amount
      # @option params [String, nil] :period_start
      # @option params [String, nil] :period_end
      # @option params [Paid::CustomViewsExperimental::Types::GetCustomViewDataRequestIncludeDraft, nil] :include_draft
      # @option params [Paid::CustomViewsExperimental::Types::GetCustomViewDataRequestUnitMode, nil] :unit_mode
      # @option params [String, nil] :unit_external_id
      #
      # @example
      #   client.custom_views_experimental.get_custom_view_data(display_id: "displayId")
      #
      # @return [Paid::Types::ViewDataResponse]
      def get_custom_view_data(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["customerId"] = params[:customer_id] if params.key?(:customer_id)
        query_params["periodKind"] = params[:period_kind] if params.key?(:period_kind)
        query_params["periodUnit"] = params[:period_unit] if params.key?(:period_unit)
        query_params["periodAmount"] = params[:period_amount] if params.key?(:period_amount)
        query_params["periodStart"] = params[:period_start] if params.key?(:period_start)
        query_params["periodEnd"] = params[:period_end] if params.key?(:period_end)
        query_params["includeDraft"] = params[:include_draft] if params.key?(:include_draft)
        query_params["unitMode"] = params[:unit_mode] if params.key?(:unit_mode)
        query_params["unitExternalId"] = params[:unit_external_id] if params.key?(:unit_external_id)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "experimental/views/#{URI.encode_uri_component(params[:display_id].to_s)}/data",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::ViewDataResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            408 => Paid::Types::ErrorResponse,
            429 => Paid::Types::ErrorResponse
          }
          error_body = Paid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body)
        end
      end

      # ⚠️ **Experimental** — this endpoint may change or be removed without notice and is not subject to v2
      # backwards-compatibility guarantees. Do not build production-critical integrations against it yet.
      #
      # Mints a short-lived, customer-scoped token for embedding a published custom view. Call this from your server
      # with your API key, then pass the returned token to the embed SDK. Organization-scoped views cannot be embedded
      # per-customer — this returns a 400 (`ORG_SCOPED_VIEW_NOT_EMBEDDABLE`) for one.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :display_id
      # @option params [String] :customer_id
      # @option params [Integer, nil] :ttl_seconds
      #
      # @example
      #   client.custom_views_experimental.get_custom_view_embed_token(
      #     display_id: "displayId",
      #     customer_id: "customerId"
      #   )
      #
      # @return [Paid::Types::CustomViewEmbedTokenResponse]
      def get_custom_view_embed_token(request_options: {}, **params)
        params = Paid::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["customerId"] = params[:customer_id] if params.key?(:customer_id)
        query_params["ttlSeconds"] = params[:ttl_seconds] if params.key?(:ttl_seconds)

        request = Paid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "experimental/views/#{URI.encode_uri_component(params[:display_id].to_s)}/embed-token",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Paid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Paid::Types::CustomViewEmbedTokenResponse.load(response.body))
        else
          error_class = Paid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
