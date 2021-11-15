https://gitmemory.cn/repo/bilalcaliskan/kubebuilder-tutorial

go mod init jaeger.operator.amn.siemens.com/m/v2
kubebuilder init --domain jaeger.operator.amn.siemens.com
kubebuilder create api --group sidecar --version v1 --kind Agent


https://book.kubebuilder.io/cronjob-tutorial/controller-implementation.html



domain: jaeger.operator.amn.siemens.com
group: sidecar
kind: Agent



	AgentName  string `json:"agentName,omitempty"`
	AgentImage string `json:"agentImage,omitempty"`
	Collector  string `json:"collector,omitempty"`

	AgentName string `json:"agentName,omitempty"`
	Collector string `json:"collector,omitempty"`




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



  # TODO(user): Add fields here
  agentName: jaeger-agent
  agentImage: jaeger-agent-image
  collector: jaeger-collector



		"context"
	"reflect"

	"github.com/go-logr/logr"
	appsv1 "k8s.io/api/apps/v1"
	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/api/errors"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/apimachinery/pkg/types"
	ctrl "sigs.k8s.io/controller-runtime"
	"sigs.k8s.io/controller-runtime/pkg/client"

	cachev1 "github.com/example-inc/memcached-operator/api/v1"