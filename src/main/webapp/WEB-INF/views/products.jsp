<%@ include file="common/header.jsp"%>
<script>
	var products = ${ productData };
	angular.module("ProductApp", []).controller("ProductController",
			function($scope) {
				$scope.prodData = products;
				$scope.sort = function(key) {
					$scope.sortKey = key;
					$scope.reverse = !$scope.reverse;
				};
			});
</script>

<div class="panel panel-info" style="padding-top: 70px;"
	ng-app="ProductApp">
	<div class="row">
		<div class="col-md-4 pull-right">
			<input type="text" placeholder="Enter Search Criteria"
				class="form-control" ng-model="search">
		</div>
	</div>
	<div class="row" ng-controller="ProductController as ctrl">
		<table class="table table-default">
			<thead>
				<tr>
					<th ng-click="sort('brand')">Brand</th>
					<th ng-click="sort('model')">Model</th>
					<th ng-click="sort('price')">Price</th>
					<th ng-click="sort('category')">Category</th>
					<th>More Info</th>
				</tr>
			</thead>
			<tbody>
				<tr
					ng-repeat="product in prodData | orderBy:sortKey:reverse | filter:search">
					<td>{{ product.brand }}</td>
					<td>{{ product.model }}</td>
					<td>{{ product.price }}</td>
					<td>{{ product.category }}</td>
					<td><a
						href="<c:url value='/productDetails/{{ product.productId }}' />">
							<i class="fa fa-exclamation-circle" aria-hidden="true"></i>
					</a></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<%@ include file="common/footer.jsp"%>