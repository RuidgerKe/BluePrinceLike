using UnityEngine;

public class SmoothCameraLook : MonoBehaviour
{
    [SerializeField] private Transform target; // Drag your player/target object here in the Inspector
    [SerializeField] private float smoothTime = 0.3f; // Controls the smoothness; adjust this value
    [SerializeField] private Vector3 offset; // The desired offset from the target

    private Vector3 currentVelocity = Vector3.zero;

    private void LateUpdate()
    {
        if (target == null) return;

        // Calculate the desired position with the offset
        Vector3 desiredPosition = target.position + offset;

        // Smoothly move the camera's position towards the desired position
        transform.position = Vector3.SmoothDamp(transform.position, desiredPosition, ref currentVelocity, smoothTime);

        // Optionally, make the camera look at the target (smoothly rotate if needed)
        // transform.LookAt(target); 
        // For smooth rotation, you could use Quaternion.Slerp()
    }
} 