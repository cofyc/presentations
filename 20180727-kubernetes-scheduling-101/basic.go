for {
	pod := getNextPod()
	node, err := findFitNode(pod)
	if err != nil {
		pod.Spec.nodeName = node.Name
		updatePod(pod)
	}
}
