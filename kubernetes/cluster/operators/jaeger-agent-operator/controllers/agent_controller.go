/*
Copyright 2021.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package controllers

import (
	"context"
	"fmt"

	v1 "k8s.io/api/core/v1"

	"k8s.io/apimachinery/pkg/api/resource"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/apimachinery/pkg/types"

	ctrl "sigs.k8s.io/controller-runtime"
	"sigs.k8s.io/controller-runtime/pkg/client"
	"sigs.k8s.io/controller-runtime/pkg/log"

	sidecarv1 "jaeger.operator.amn.siemens.com/m/v2/api/v1"
)

// AgentReconciler reconciles a Agent object
type AgentReconciler struct {
	client.Client
	Scheme *runtime.Scheme
}

//+kubebuilder:rbac:groups=sidecar.jaeger.operator.amn.siemens.com,resources=agents,verbs=get;list;watch;create;update;patch;delete
//+kubebuilder:rbac:groups=sidecar.jaeger.operator.amn.siemens.com,resources=agents/status,verbs=get;update;patch
//+kubebuilder:rbac:groups=sidecar.jaeger.operator.amn.siemens.com,resources=agents/finalizers,verbs=update

// Reconcile is part of the main kubernetes reconciliation loop which aims to
// move the current state of the cluster closer to the desired state.
// TODO(user): Modify the Reconcile function to compare the state specified by
// the Agent object against the actual cluster state, and then
// perform operations to make the cluster state reflect the state specified by
// the user.
//
// For more details, check Reconcile and its Result here:
// - https://pkg.go.dev/sigs.k8s.io/controller-runtime@v0.10.0/pkg/reconcile
func (r *AgentReconciler) Reconcile(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {

	l := log.FromContext(ctx)

	l.Info("Reconcile Agent: Req: ", "req", req)

	agentSideCar := &sidecarv1.Agent{}
	r.Get(ctx, req.NamespacedName, agentSideCar)

	l.Info("SideCar ", "Spec", agentSideCar.Spec)

	if agentSideCar.Spec.AgentName != agentSideCar.Status.AgentName {
		agentSideCar.Status.AgentName = agentSideCar.Spec.AgentName
		agentSideCar.Status.Collector = agentSideCar.Spec.Collector
		r.Status().Update(ctx, agentSideCar)
	}

	l.Info("SideCar ", "Status", agentSideCar.Status)

	pvc := &v1.PersistentVolumeClaim{}
	err := r.Get(ctx, types.NamespacedName{Name: agentSideCar.Name, Namespace: agentSideCar.Namespace}, pvc)

	if err != nil {
		l.Info("PVC Found")
	}

	if err != nil {
		l.Info("PVC Found")
	}

	l.Info("PVC Not Found")

	storageClass := "hostpath"
	storageRequest, _ := resource.ParseQuantity(fmt.Sprintf("%dGi", 10))

	pvc = &v1.PersistentVolumeClaim{
		ObjectMeta: metav1.ObjectMeta{
			Namespace: agentSideCar.Namespace,
			Name:      agentSideCar.Name,
		},
		Spec: v1.PersistentVolumeClaimSpec{
			StorageClassName: &storageClass,
			AccessModes:      []v1.PersistentVolumeAccessMode{"ReadWriteOnce"},
			Resources: v1.ResourceRequirements{
				Requests: v1.ResourceList{"storage": storageRequest},
			},
		},
	}

	l.Info("SideCar ", "Pvc.Spec", pvc.Spec)

	l.Info("Create PVC")
	r.Create(ctx, pvc)
	return ctrl.Result{}, nil
}

// SetupWithManager sets up the controller with the Manager.
func (r *AgentReconciler) SetupWithManager(mgr ctrl.Manager) error {
	return ctrl.NewControllerManagedBy(mgr).
		For(&sidecarv1.Agent{}).
		Complete(r)
}
